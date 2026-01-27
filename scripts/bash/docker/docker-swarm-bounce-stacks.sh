#!/usr/bin/env bash

DOCKER_DIR="/mnt/docker"
STEP=$1

#! Array of stacks running on docker swarm cluster.
declare -a STACKS=(
	stack0
	stack1
	stack2
	stack3
	stack4
	stack5)

#! Array of known bounce failures
declare -a BOUNCE_FAILS=()
#! Array of known bounce successes
declare -a BOUNCE_SUCCESS=()

#! STACK BOUNCER: Bounce all stacks and services in $STACKS
stack_bouncer() {
  # tunables
  local wait_sleep=2           # seconds between checks
  local wait_max_checks=60     # 60 * 2s = ~2 minutes max

  for service in "${STACKS[@]}"; do
	# HEADER
	echo -e " ${B_BLUE}Bouncing: ${B_MAGENTA}$service${NC}\n"

    # GO TO STACK DIR (skip if missing)
    if ! cd "$DOCKER_DIR/$service" 2>/dev/null; then
      echo -e "${B_RED} - ${RED}Missing directory ${MAGENTA}$DOCKER_DIR/$service${RED}. Skipping.\n\n${B_RED} - - -${NC}"
	  BOUNCE_FAILS+=("$service")
      continue
    fi

    # REMOVE STACK
    echo -e "${BLUE}  Removing ${MAGENTA}$service ${BLUE}now.${NC}"

    if ! docker stack rm "$service"  > /dev/null 2>&1; then
      echo -e "${B_RED} - ${RED}Failed to remove ${MAGENTA}$service${RED}. Skipping.\n\n${B_RED} - - -${NC}"
      BOUNCE_FAILS+=("$service")
      continue
    fi

    # ASYNC WAIT: hold until the stack no longer appears (or timeout)
    echo -e "${CYAN}   * Waiting for ${MAGENTA}$service${CYAN} to be fully removed.${NC}"

    local checks=0
    while docker stack ls --format '{{.Name}}' | grep -Fxq "$service"; do
      if (( checks++ >= wait_max_checks )); then
        echo -e "${B_RED} - ${RED}Timed out waiting for ${MAGENTA}$service${RED} to be removed.\n\n${B_RED} - - -${NC}"
        break
      fi
      sleep "$wait_sleep"
    done

    # RESTART STACK
    echo -e "${BLUE}  Restarting ${MAGENTA}$service ${BLUE}now.${NC}"

    compose_file="$DOCKER_DIR/$service/docker-compose.yml"
    if [[ ! -f "$compose_file" ]]; then
      	echo -e "${B_RED} - ${RED}Missing compose file ${MAGENTA}$compose_file${RED}. Skipping.\n\n${B_RED} - - -${NC}"
		BOUNCE_FAILS+=("$service")
      	continue
    fi

    if ! docker stack deploy --detach=true --quiet --compose-file "$compose_file" "$service" > /dev/null 2>&1; then
      	echo -e "${B_RED} - ${RED}Failed to deploy ${MAGENTA}$service${RED}. Skipping.\n\n${B_RED} - - -${NC}"
		BOUNCE_FAILS+=("$service")
      	continue
	else
		BOUNCE_SUCCESS+=("$service")
    fi

    # (Optional) brief settle time after deploy
    sleep 2.5

    # CHECK STATUS
    echo -e "${BLUE}  Checking ${MAGENTA}$service${BLUE} status.${NC}\n"
    stack_status "$service"
    # case "$STEP" in
    #   step|-step|--step|-s|--s|-S|--S)
    #     read -p "Press enter to continue or Ctrl+C to cancel."
    #     ;;
    #   *)
    #     continue
    #     ;;
    # esac
  done
  read -p "Press enter to continue or Ctrl+C to cancel."
}

#! STACK CHECKER: Check the status of all services in a specific stack.
#! Show per-service Desired/Current state (filters historical/Shutdown), with Node
#
# Usage:
#   stack_states <stack> [<stack> ...]
#   stack_states <stack>... <service_regex>
#   service='dozzle_dozzle\..*' stack_states dozzle    # can also use $service env var
#
# Notes:
# - If the last argument is not a known stack name, it is treated as a service regex filter.
# - Historical/relocated tasks (lines whose NAME begins with " _ ") are excluded.
# - Tasks whose DesiredState == "Shutdown" are excluded.
# - Prints blocks like:
#
# - - -
#
# STACK: <stack>
#
#    SERVICE:  <name>
#    NODE:     <node>
#    DESIRED:  <desired>
#    CURRENT:  <current>
#
stack_status() {
	if [ $# -lt 1 ]; then
		echo "Usage: stack_status <stack> [<stack> ...] [optional_service_regex]" >&2
		return 1
	fi

	local service_filter="${service:-}"
	local -a args=("$@")

	# Get known stacks to help decide if the last arg is a service regex
	local known
	known="$(docker stack ls --format '{{.Name}}' 2>/dev/null)" || known=""

	# If there are multiple args and the last one isn't a known stack name,
	# treat it as a service regex filter.
	if [ ${#args[@]} -gt 1 ]; then
		local last_idx=$(( ${#args[@]} - 1 ))
		local last_arg="${args[$last_idx]}"

		local is_known_stack=false
		local s
		while IFS= read -r s; do
		[ -n "$s" ] || continue
		if [ "$last_arg" = "$s" ]; then
			is_known_stack=true
			break
		fi
		done <<< "$known"

		if [ "$is_known_stack" = false ]; then
		service_filter="$last_arg"
		unset 'args[$last_idx]'
		fi
	fi

	# Remaining args are stacks
	local -a stacks=("${args[@]}")
	if [ ${#stacks[@]} -eq 0 ]; then
		echo -e "${B_RED} - ${RED}No valid stacks provided.\n\n${B_RED} - - - ${NC}" >&2
		return 1
	fi

	local fmt='{{.Name}}|{{.Node}}|{{.DesiredState}}|{{.CurrentState}}'

	local stack out
	for stack in "${stacks[@]}"; do
		if ! out="$(docker stack ps "$stack" --format "$fmt" 2>/dev/null)"; then
			echo -e "\n${B_WHITE}  STACK:${NC} ${B_BLUE}$stack"
			echo -e "${B_RED} - ${RED}Failed to read tasks (does this stack exist / permissions?).\n\n${B_RED} - - - ${NC}"
			continue
		fi

		# Optional service filter (regex on the Name field)
		if [ -n "$service_filter" ]; then
			out="$(printf '%s\n' "$out" | awk -F'|' -v svc="$service_filter" '$1 ~ svc')"
		fi

		# Remove historical/relocated (leading underscore) and DesiredState==Shutdown
		out="$(printf '%s\n' "$out" \
		| awk -F'|' '!($1 ~ /^[[:space:]]*_/)' \
		| awk -F'|' '$3 != "Shutdown"')"

		echo -e "${B_WHITE}  STACK:  ${B_MAGENTA}$stack${NC}"

		if [ -z "$out" ]; then
			echo -e "${B_RED} - ${RED}No matching tasks.\n\n${B_RED} - - - ${NC}"
			continue
		fi

		# Print blocks
		local name node desired current
		while IFS='|' read -r name node desired current; do

		# ltrim service name (in case of stray spaces)
		name="${name#"${name%%[![:space:]]*}"}"
		echo -e "\n${B_WHITE}    SERVICE:${NC}  ${MAGENTA}$name${NC}"
		echo -e "${B_WHITE}    NODE:${NC}     ${CYAN}$node${NC}"
		echo -e "${B_WHITE}    DESIRED:${NC}  $desired"
		echo -e "${B_WHITE}    CURRENT:${NC}  $current"
		done <<< "$out"
		echo -e "${B_RED} - - -${NC}"
	done
}

bounce_report() {
	echo -e "${B_BLUE} Bounce report${NC}"
	if [ ${#BOUNCE_SUCCESS[@]} -gt 0 ]; then
		echo -e "${B_GREEN} * Successfully bounced the following stacks:${NC}"
		for stack in "${BOUNCE_SUCCESS[@]}"; do
		echo -e "${B_WHITE}    STACK:${NC}  ${B_BLUE}$stack${NC}"
		done
	fi
	if [ ${#BOUNCE_FAILS[@]} -eq 0 ]; then
		return
	else
		echo -e "\n${B_RED} * Failed to remove the following stacks:${NC}"
		for stack in "${BOUNCE_FAILS[@]}"; do
		echo -e "${B_WHITE}    STACK:${NC}  ${B_BLUE}$stack${NC}"
		done
	fi
}

#! Main script
echo -e "\n${B_GREEN}Bouncing Stacks and Services.\n\nThe following stacks will be bounced:${YELLOW}"
for stack in "${STACKS[@]}"; do
	echo -e "${B_WHITE} STACK:  ${B_BLUE}$stack${NC}"
done
echo -e "${B_YELLOW}"
read -p "Press enter to continue or Ctrl+C to cancel."
echo -e "${B_RED} - - -${NC}"

stack_bouncer
bounce_report
echo -e "${B_RED} - - -${NC}\n"
echo -e "${B_GREEN}Bounce complete.${NC}\n"
