#?#    To use copy this file to $HOME as ".bash_aliases" or ".aliases"
#?#    ".bash_aliases" is recomended for portability.

#!##############################################################################
#! - - - - - !#           Source function for rc files           #! - - - - - !#
#!##############################################################################

#*#    Add the following function to your .bashrc or .zshrc file to source ~/.bash_aliases or ~/.aliases
# source_aliases() {
#     if [ -f ~/.aliases ]; then echo -e "\033[1;33m~/.aliases found, sourcing...\033[0m"; fi
#     if [ -f ~/.bash_aliases ]; then echo -e "\033[1;33m~/.bash_aliases found, sourcing...\033[0m"; fi
#     if [ -f ~/.zsh_aliases ]; then echo -e "\033[1;33m~/.zsh_aliases found, sourcing...\033[0m"; fi
#     if [ -f ~/.aliases ]; then ". ~/.aliases"; fi
#     if [ -f ~/.bash_aliases ]; then ". ~/.bash_aliases"; fi
#     if [ -f ~/.zsh_aliases ]; then ". ~/.zsh_aliases"; fi
# }
# source_aliases
# if [ -f ~/.aliases ]; then
#     echo -e "\033[1;33m~/.aliases found, sourcing...\033[0m"
# fi
# if [ -f ~/.bash_aliases ]; then
#     "\033[1;33m~/.bash_aliases found, sourcing...\033[0m"
# fi
# if [ -f ~/.aliases ]; then
#     . ~/.bash_aliases
# fi
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

#!##############################################################################
#! - - - - - !#             Standard variables below             #! - - - - - !#
#!##############################################################################

#^#    Export editor    #!  Moved to zshrc and bashrc
# export_editor() {
# 	if [ -x "$(which "hx" 2>/dev/null)" ]; then
# 		export EDITOR='hx'
# 	elif [ -x "$(which "nano" 2>/dev/null)" ]; then
# 		export EDITOR='nano'
# 	elif [ -x "$(which "nvim" 2>/dev/null)" ]; then
# 		export EDITOR='nvim'
# 	elif [ -x "$(which "vi" 2>/dev/null)" ]; then
# 		export EDITOR='vi'
# 	fi
# }
# export_editor #! Called .bashrc or .zshrc

# #^#    Export default XDG Base Directory variables    #!  Moved to zshrc and bashrc
# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_STATE_HOME="$HOME/.local/state"

# #^#    Export basic colors variables    #!  Moved to zshrc and bashrc
# export RED='\033[0;31m'           # Red              ${RED}
# export U_RED='\e\033[4;31m'       # U Line Red       ${U_RED}
# export B_RED='\033[1;31m'         # Bold Red         ${B_RED}
# export GREEN='\033[0;32m'         # Green            ${GREEN}
# export U_GREEN='\e\033[4;32m'     # U Line Green     ${U_GREEN}
# export B_GREEN='\033[1;32m'       # Bold Green       ${B_GREEN}
# export YELLOW='\033[0;32m'        # Yellow           ${YELLOW}
# export U_YELLOW='\e\033[4;33m'    # U Line Yellow    ${U_YELLOW}
# export B_YELLOW='\033[1;33m'      # Bold Yellow      ${B_YELLOW}
# export BLUE='\033[0;34m'          # Blue             ${BLUE}
# export U_BLUE='\e\033[4;34m'      # U Line Blue.     ${U_BLUE}
# export B_BLUE='\033[1;34m'        # Bold Blue        ${B_BLUE}
# export MAGENTA='\033[0;35m'       # Magenta          ${MAGENTA}
# export U_MAGENTA='\e\033[4;35m'   # U Line Magenta   ${U_MAGENTA}
# export B_MAGENTA='\033[1;35m'     # Bold Magenta     ${B_MAGENTA}
# export CYAN='\033[0;36m'          # Cyan             ${CYAN}
# export U_CYAN='\e\033[4;36m'      # U Line Cyan      ${U_CYAN}
# export B_CYAN='\033[1;36m'        # Bold Cyan        ${B_CYAN}
# export WHITE='\033[0;37m'         # White            ${WHITE}
# export U_WHITE='\e\033[4;37m'     # U Line White     ${U_WHITE}
# export B_WHITE='\033[1;37m'       # Bold White       ${B_WHITE}
# export BLACK='\033[0;30m'         # Black            ${BLACK}
# export U_BLACK='\e\033[4;30m'     # U Line Black.    ${U_BLACK}
# export B_BLACK='\033[1;30m'       # Bold Black       ${B_BLACK}
# export NC='\033[0m'               # No Color         ${NC}

#^#    Github and Gitea
export GITHUB_USER=''
export GITHUB_URL=''
export GITHUB_TOKEN=''
export GITEA_USER=''
export GITEA_URL=''
export GITEA_TOKEN=''

#^#    Export Hostname and Short Hostname
export FULL_HOSTNAME='$(hostname -f)'
export SHORT_HOSTNAME='$(hostname -s)'

#!##############################################################################
#! - - - - - !#              Standard aliases below              #! - - - - - !#
#!##############################################################################

#^#    Failsafe ls aliases    #!  Moved to zshrc and bashrc
# alias ls='ls -ACF --color=auto'  			            		#?#  Failsafe ls aliases
# alias l='ls -ACF --color=auto'  			            		#?#  Failsafe ls aliases
# alias ll='ls -ahp --color=auto'  			            		#?#  Failsafe ls aliases
# alias lll='ls -ahpl --color=auto'  				            	#?#  Failsafe ls aliases
# alias lr='ls -alhR --color=auto'  				            	#?#  Failsafe ls aliases

#^#    Aliases to add color to basic commands
alias grep='grep --color=auto'						            #?#  Aliases to add color to basic commands
alias fgrep='fgrep --color=auto'  					            #?#  Aliases to add color to basic commands
alias egrep='egrep --color=auto'  					            #?#  Aliases to add color to basic commands
alias ls='ls --color=auto'	     					            #?#  Aliases to add color to basic commands

#^#    Go somewhere
alias home='cd ~/' 				 					            #?#  Go $home
alias bk='cd "$OLDPWD"'	 							            #?# Go to previous directory

#^#    Permissions and ownership
alias chx='chmod +x'  								            #?#  chmod

#^#    File and directory operations
alias cd~='cd ~'  								                #?#  ls - get size
alias size='\ls -hs'  								            #?#  ls - get size
alias rsync='rsync -avz'  							            #?#  rsync verbose
alias mkdir='mkdir --parents --verbose'  			            #?#  mkdir -p
alias cp='cp --verbose'  							            #?#  cp verbose
alias cpr='cp --recursive --verbose' 				            #?#  cp recursive
alias rmdir='rmdir --parents --verbose'  			            #?#  rmdir verbose
alias rm='rm --force --recursive -I --verbose'  	            #?#  rm interactive

#^#    Archives tar, zip, ect ...
alias ctar='tar -cvf'  								            #?#  Create Tar
alias xtar='tar -xvf'  								            #?#  Extract Tar

#^#    Info
alias where='which' 											#?#  Which and whereis
alias dt='echo -e "\n$(date "+%Y-%m-%d %H:%M:%S")\n"' 			#?#  date
alias timestamp='echo -e "\n$(date +"%Y-%m-%d %H:%M:%S")\n"'  	#?#  date

#^#    Network
alias ping='ping -c 4'  						            	#?#  ping
alias tracert='traceroute' 						            	#?#  traceroute
alias apply-np='sudo netplan apply'	 			            	#?#  netplan apply

#^#    System logoff,shutdown, and reboot
alias logoff='logout'  							            	#?#  logout
alias shutdown='sudo shutdown now'  			            	#?#  shutdown
alias restart='sudo reboot now' 				            	#?#  reboot
alias reboot='sudo reboot now'  				            	#?#  reboot

#^#    Odds and ends
alias cls='clear'  								            	#?#  clear screen
alias fstab='sudo cat /etc/fstab'  				            	#?#  show fstab
alias sname='echo "$SHORT_HOSTNAME"'  			            	#?#  show short hostname

#^#    Apt aliases
#?#  Full apt update, upgrade, autoremove, and clean
alias update='sudo apt update -qq; sudo apt full-upgrade --fix-missing -qq -y; sudo apt autoremove -qq -y; sudo apt autoclean -qq -y'
#?#  Quick update and upgrade
alias apt='sudo apt update -qq -y && sudo apt full-upgrade -qq -y'
#?#  Update and upgrade system then upgrade distro release
alias update-dist='sudo apt update && sudo apt full-upgrade -y && sudo do-release-upgrade'
alias upgrade-dist='update-dist' 					            #?#  upgrade distro release

#^#    Mount aliases
alias mount='sudo mount' 						            	#?#  sudo mount
alias mnt-re='mount -a' 						            	#?#  mount
alias umount='sudo umount' 						            	#?#  un-mount

#!##############################################################################
#! - - - - - !#   Standard aliases functions, and tests below    #! - - - - - !#
#!##############################################################################

#*#    list nfs mount function
mount_ls() {
    echo -e "\n${BLUE}Mounted NFS Shares:${NC}\n"
    mount -l | grep -E "10\.36\.129\.(21|23|41|42|43)" | awk '{printf "%-40s %-20s\n", $3, $1}'
    mount -l | grep -E "10\.36\.129\.100" | awk '{printf "%-40s %-20s\n", $3, $1}'
    echo -e "${NC}"
}

#*# Set alias for rm_dot_gitfunction

alias mnt-ls='mount_ls'

#! - - - - - !#

#*#    Better "cd" with directory listing and previous/current directory info

cd() {
    local DIR="$1"
    echo
    builtin cd "$DIR"
    ls "$DIR"
    DIR="$(pwd)"
}

#! - - - - - !#

#*#    Print IP addresses for each physical network interface

ips() {
    if [[ "$(uname -s)" == "Darwin" ]]; then
        # macOS
        ifconfig | awk '/inet / && !/127.0.0.1|docker|br-|veth/ {print $2}'
    elif [[ "$(uname -s)" == "Linux" ]]; then
        # Linux
        echo -e "\n\e[4;33mPhysical Network Interfaces:\e[0m\n"
        echo -e "\033[0;32m$(ip -o -4 addr list | \grep -vE ' lo|docker|br-|veth' | awk '{print $2," - ",$4}' | cut -d/ -f1)\033[0m\n\n"
    fi
}

#! - - - - - !#

#*#    Flush DNS cache

flushdns() {
    echo -e "\n \e[4;33mFlushing DNS cache\e[0m\n"
    if [[ "$(uname -s)" == "Darwin" ]]; then
        # macOS
        sudo dscacheutil -flushcache
        sudo killall -HUP mDNSResponder
    elif [[ "$(uname -s)" == "Linux" ]]; then
        # Linux (Ubuntu 22.04 and up)
        sudo resolvectl flush-caches
    fi
    for _ in {1..27}; do
        echo -ne "\e[31m▓\e[0m"
        sleep 0.075
    done
    echo -e "\n\n \e[32mDNS cache has been flushed\e[0m\n"
}

#! - - - - - !#

#*#    Determine shell and reload config
# reload_shell() {
#     case "$SHELL" in
#         '/bin/zsh')
#             source "${HOME}/.zshrc"
#             echo -e "\e[32mzsh configuration reloaded\e[0m\n"
#         ;;
#         '/bin/bash')
#             source "${HOME}/.bashrc"
#             echo -e "\e[32mbash configuration reloaded\e[0m\n"
#         ;;
#         *)
#             echo -e "\n\e[31mError: Unsupported shell: \e[0m'$SHELL'\e[0m\n"
# 			return 1
#         ;;
#     esac
# }
# alias shellr='reload_shell'

#! - - - - - !#

#*#    Show user info

show_user_info() {
    touch /tmp/id > /dev/null 2>&1
    id | tr \, \\n > /tmp/id > /dev/null 2>&1
    sed -i "1d" /tmp/id
    echo -e "\n${RED}========================================${NC}\n"
    echo -e "${BLUE}- USER\n${GREEN}$(whoami)${NC}\n"
    echo -e "${BLUE}- UID\n${GREEN}$(id -u)${NC}\n"
    echo -e "${BLUE}- GID\n${GREEN}$(id -g)${NC}\n"
    echo -e "${BLUE}- GROUPS\n${GREEN}$(\cat /tmp/id)${NC}"
    echo -e "\n${RED}========================================${NC}\n"
    rm -rf /tmp/id > /dev/null 2>&1
}

#*# Set alias for rm_dot_gitfunction

alias me='show_user_info'
alias idme='me'

#! - - - - - !#

#*#    Display public ssh keys and authorized_keys file. pub-key, list-keys, auth-keys

#^#    Display your primary ssh key

print_my_key(){
    echo -e "\n${BLUE}~/.ssh/id_ed25519.pub\n\n${YELLOW}  $(\cat ~/.ssh/id_ed25519.pub)${NC}\n\n"
}

#*# Set alias for rm_dot_gitfunction

alias pub-key='print_my_key'
alias my-key='pub-key'

#^#    List all public keys in ~/.ssh

find_user_ssh_keys() {
    echo -e "\n${BLUE}Listing all ssh public keys in ${CYAN}$HOME/.ssh${NC}\n"
    find ~/.ssh -type f -name "*.pub" -exec sh -c 'echo ${YELLOW} - - - - -; echo ; printf " "; echo ${BLUE}{}:${CYAN}; echo ; printf " "; cat "{}" | fold -w 80; echo' \;
    echo -e "${YELLOW} - - - - -${NC}\n"
}

#*# Set alias for rm_dot_gitfunction

alias list-keys='find_user_ssh_keys'

#^#    Display your authorized_keys file

print_authorized_keys() {
    echo -e "\n${BLUE} ~/.ssh/authorized_keys\n\n${YELLOW}$(\cat ~/.ssh/authorized_keys)${NC}\n\n"
}

#*# Set alias for rm_dot_gitfunction

alias auth-keys='print_authorized_keys'

#^#   Helper function to run "print_my_key", "print_authorized_keys", or "find_user_ssh_keys" functions using the "keys" alias

print_keys() {
    case "$1" in
        "my"|"pub")
            print_my_key
        ;;
        "auth"|"authorized")
            print_authorized_keys
        ;;
        "ls"|"list")
              find_user_ssh_keys
        ;;
        *)
              print_my_key
              echo -e "${BLUE}Usage: ${MAGENTA}keys [my|pub|auth|ls]${NC}\n"
              echo -e "${BLUE}Display your primary ssh key: ${MAGENTA}keys [my|pub]${NC}"
              echo -e "${BLUE}Display your authorized_keys file: ${MAGENTA}keys [auth]${NC}"
              echo -e "${BLUE}List all public keys in ~/.ssh: ${MAGENTA}keys [ls]${NC}\n"
              return 1
        ;;
    esac
}

#*# Set alias for   function

alias keys='print_keys'

#! - - - - - !#

#*#   Simple loading bar

loading_bar() {
	local bar_length="$1"
	for _ in {1..40}; do
		echo -ne "\e[31m▓\e[0m"
		sleep 0.01
	done
}

#! - - - - - !#

#*# Remove existing .git in $PWD

rm_dot_git() {
	if [ -d "$PWD/.git" ]; then
		echo -e "\n${B_RED}!!! ${RED}Found $PWD/.git ${B_RED}!!!${YELLOW}\n\n$(find "$PWD" -name '.git')\n${B_YELLOW}"

		read -rp " - Remove $PWD/.git? [y/n] " -n 1 -r

		if [[ $REPLY =~ ^[Yy]$ ]]; then
			echo -e "\n\n${RED}Removing $PWD/.git${NC}\n"
			rm -rf "$PWD/.git" & loading_bar 40
			echo -e "\n\n${GREEN}Removed $PWD/.git\n\n${B_GREEN}:)${NC}"
			return 0
		else
			echo -e "\n\n${YELLOW}Keeping $PWD/.git\n\n${B_YELLOW}:'(${NC}"
			return 1
		fi
	else
		echo -e "\n${GREEN}No git repo found in $PWD\n\n${B_GREEN}:)${NC}"
		return 0
	fi
}

#*# Set alias for rm_dot_gitfunction

alias rmgit='rm_dot_git'
alias gitrm='rm_dot_git'

#! - - - - - !#

#*#    Check fail2ban jails

check_jails() {
    JAILS=`sudo fail2ban-client status | grep "Jail list" | sed -E 's/^[^:]+:[ \t]+//' | sed 's/,//g'`
    if command -v fail2ban-client >/dev/null 2>&1; then
        for JAIL in $JAILS
        do
            sudo fail2ban-client status $JAIL
        done
    else
        echo -e "\n${YELLOW}Fail2ban does not appear to be installed. Install by running:${RED}\n"
    fi
}

#*# Set alias for check_jails function

alias jails='check_jails'

#! - - - - - !#

#*#    cd or ls to APPDATA directory aliases function

appdata() {
    if [ ! -z "$APPDATA" ]; then
        case "$1" in
            "ls")
                ls "$APPDATA"
            ;;
            "cd")
                cd "$APPDATA" || return ; echo ; ls
            ;;
            *)
                echo -e "\nAppdat Dir: $APPDATA\n${B_BLUE}Usage: appdata [ls|cd]${NC}\n"
                return 1
            ;;
        esac
    else
        echo -e "\n${B_RED}Error: APPDATA environment variable is not set.${NC}\n"
    fi
}

#! - - - - - !#

#*#    Replace ls with eza or lsd if available and set ls aliases and failsafe settings incase of issues

ls_setup() {
    #^	eza
    if [ -x "$(which "eza")" ]; then
        export EZA_CONFIG_DIR='$HOME/.config/eza/'
        eza_l() {
            local DIR="${1:-$(pwd)}"
            echo -e "    ${GREEN}CURRENT DIR: ${B_GREEN}$(pwd)${NC}\n"
            # eza --grid --across --classify=auto --icons=auto --color=auto "$DIR"
			eza --grid --classify=auto --icons=auto --color=auto --group-directories-first "$DIR"
            DIR="$(pwd)"
            echo -e "\n    ${BLUE}PREVIOUS DIR:    ${B_BLUE}${OLDPWD}    ${B_RED}>>    ${GREEN}CURRENT DIR:    ${B_GREEN}$(pwd)${NC}\n"
        }
        eza_ll() {
            local DIR="${1:-$(pwd)}"
            echo -e "    ${GREEN}CURRENT DIR: ${B_GREEN}$(pwd)${NC}\n"
            # eza -AM --grid --across --classify=auto --icons=auto --color=auto "$DIR"
			eza -AM --grid --classify=auto --icons=auto --color=auto --group-directories-first "$DIR"
            DIR="$(pwd)"
            echo -e "\n    ${BLUE}PREVIOUS DIR:    ${B_BLUE}${OLDPWD}    ${B_RED}>>    ${GREEN}CURRENT DIR:    ${B_GREEN}$(pwd)${NC}\n"
        }
        eza_lll() {
            local DIR="${1:-$(pwd)}"
            echo -e "    ${GREEN}CURRENT DIR: ${B_GREEN}$(pwd)${NC}\n"
            eza -ahlgM --classify=auto --icons=always --color=auto "$DIR"
            DIR="$(pwd)"
            echo -e "\n    ${BLUE}PREVIOUS DIR:    ${B_BLUE}${OLDPWD}    ${B_RED}>>    ${GREEN}CURRENT DIR:    ${B_GREEN}$(pwd)${NC}\n"
        }
        # echo -e "\033[0;32m * \033[1;34meza\033[0;32m detected, alaising \033[1;34meza\033[0;32m to \033[1;34mls\033[0m"
        alias ls='eza_l '
        alias l='eza_l '
        alias ll='eza_ll '
        alias lll='eza_lll '
    #^	lsd
    elif [ -x "$(which "lsd" 2>/dev/null)" ]; then
        lsd_l() {
            local DIR="${1:-$(pwd)}"
            echo -e "    ${GREEN}CURRENT DIR: ${B_GREEN}$(pwd)${NC}\n"
            lsd --classify --group-dirs last "$DIR"
            DIR="$(pwd)"
            echo -e "\n    ${BLUE}PREVIOUS DIR:    ${B_BLUE}${OLDPWD}    ${B_RED}>>    ${GREEN}CURRENT DIR:    ${B_GREEN}$(pwd)${NC}\n"
        }
        lsd_ll() {
            local DIR="${1:-$(pwd)}"
            echo -e "    ${GREEN}CURRENT DIR: ${B_GREEN}$(pwd)${NC}\n"
            lsd -Ah --classify --group-dirs last --git "$DIR"
            DIR="$(pwd)"
            echo -e "\n    ${BLUE}PREVIOUS DIR:    ${B_BLUE}${OLDPWD}    ${B_RED}>>    ${GREEN}CURRENT DIR:    ${B_GREEN}$(pwd)${NC}\n"
        }
        lsd_lll() {
            local DIR="${1:-$(pwd)}"
            echo -e "    ${GREEN}CURRENT DIR: ${B_GREEN}$(pwd)${NC}\n"
            lsd -alh --classify --group-dirs last --git "$DIR"
            DIR="$(pwd)"
            echo -e "\n    ${BLUE}PREVIOUS DIR:    ${B_BLUE}${OLDPWD}    ${B_RED}>>    ${GREEN}CURRENT DIR:    ${B_GREEN}$(pwd)${NC}\n"
        }
        # echo -e "\033[0;32m * \033[1;34mlsd\033[0;32m detected, alaising \033[1;34mlsd\033[0;32m to \033[1;34mls\033[0m"
        alias ls='lsd --classify --group-dirs last '
        alias l='lsd_l'
        alias ll='lsd_ll'
        alias lll='lsd_lll'
    #^	ls
    elif [ -x "$(which "ls" 2>/dev/null)" ]; then
        ls_l() {
            local DIR="${1:-$(pwd)}"
            echo -e "    ${GREEN}CURRENT DIR: ${B_GREEN}$(pwd)${NC}\n"
            ls -CFA --color=auto "$DIR"
            DIR="$(pwd)"
            echo -e "\n    ${BLUE}PREVIOUS DIR:    ${B_BLUE}${OLDPWD}    ${B_RED}>>    ${GREEN}CURRENT DIR:    ${B_GREEN}$(pwd)${NC}\n"
        }
        ls_ll() {
            local DIR="${1:-$(pwd)}"
            echo -e "    ${GREEN}CURRENT DIR: ${B_GREEN}$(pwd)${NC}\n"
            ls -ahp --color=auto "$DIR"
            DIR="$(pwd)"
            echo -e "\n    ${BLUE}PREVIOUS DIR:    ${B_BLUE}${OLDPWD}    ${B_RED}>>    ${GREEN}CURRENT DIR:    ${B_GREEN}$(pwd)${NC}\n"
        }
        ls_lll() {
            local DIR="${1:-$(pwd)}"
            echo -e "    ${GREEN}CURRENT DIR: ${B_GREEN}$(pwd)${NC}\n"
            ls -ahpl --color=auto "$DIR"
            DIR="$(pwd)"
            echo -e "\n    ${BLUE}PREVIOUS DIR:    ${B_BLUE}${OLDPWD}    ${B_RED}>>    ${GREEN}CURRENT DIR:    ${B_GREEN}$(pwd)${NC}\n"
        }
        ls_lr() {
            local DIR="${1:-$(pwd)}"
            echo
            ls -alhR --color=auto "$DIR"
            echo
        }
        alias ls='ls -CFA --color=auto '
        alias l='ls_lll'
        alias ll='ls_ll'
        alias lll='ls_lll'
        alias lsr='ls_lr'
    fi
}

# ls_setup #! Called at the bottom in the "Call functions" section

#! - - - - - !#

#*#    Replace defaults aliases

#^#    Function to replace grep with rg

ripgrep_setup() {
    if [ -x "$(which rg 2>/dev/null)" ]; then
        # echo -e "\033[0;32m * \033[1;34mripgrep\033[0;32m detected, alaising \033[1;34mrg\033[0;32m to \033[1;34mgrep\033[0m"
        alias grep='rg --color=auto'
        alias ggrep='rg --color=auto'
    fi
}

# ripgrep_setup #! Called at the bottom in the "Call functions" section

#^#    Function to replace cat with bat

bat_setup() {
    if [ -x "$(which bat 2>/dev/null)" ]; then
        # echo -e "\033[0;32m * \033[1;34mbat\033[0;32m detected, alaising \033[1;34mbat\033[0;32m to \033[1;34mcat\033[0m"
        alias cat='bat -f --theme=gruvbox-dark --style=default --wrap=auto'
        alias bcat='bat'
        alias ccat='\cat'
    fi
}

# bat_setup #! Called at the bottom in the "Call functions" section

#^#    replace cat with batcat

batcat_setup() {
if [ -x "$(which batcat 2>/dev/null)" ]; then
    # echo -e "\033[0;32m * \033[1;34mbatcat\033[0;32m detected, alaising \033[1;34mbatcat\033[0;32m to \033[1;34mcat\033[0m"
    alias cat='batcat -f --theme=gruvbox-dark --style=default --wrap=auto'
	alias bcat='batcat'
	alias ccat='\cat'
fi
}

# batcat_setup #! Called at the bottom in the "Call functions" section

#*##############################################################################
#* - - - - - *#     Extra aliases functions, and tests below     #* - - - - - *#
#*##############################################################################

#*#    Rustormy Weather cli utility

#^ Rustormy variables

export CITY="Riyadh"
export LATITUDE="24.6815"
export LONGITUDE="46.6214"
export PROVIDER="om"

#^ Rustormy function

weather() {
	if [ -x "$(which "rustormy")" ]; then
		case $1 in
			"ksa")
				echo
				rustormy -c "Riyadh" --name --colors --lat "24.6815" --lon "46.6214" --provider $PROVIDER --one-line
				echo
				;;
			"--ksa")
				echo
				rustormy -c "Riyadh" --name --colors --lat "24.6815" --lon "46.6214" --provider $PROVIDER
				echo
				;;
			"rdu")
				echo
				rustormy -c "Raleigh" --name --colors --lat "35.8319" --lon "-78.5992" --provider $PROVIDER --one-line
				echo
				;;
			"--rdu")
				echo
				rustormy -c "Raleigh" --name --colors --lat "35.8319" --lon "-78.5992" --provider $PROVIDER
				echo
				;;
			"kin")
				echo
				rustormy -c "Goldsboro" --name --colors --lat "35.3336" --lon "-77.9404" --provider $PROVIDER --one-line
				echo
				;;
			"--kin")
				echo
				rustormy -c "Goldsboro" --name --colors --lat "35.3336" --lon "-77.9404" --provider $PROVIDER
				echo
				;;
			"--all")
				echo
				rustormy -c "Riyadh" --name --colors --lat "24.6815" --lon "46.6214" --provider $PROVIDER --one-line
				rustormy -c "Raleigh" --name --colors --lat "35.8319" --lon "-78.5992" --provider $PROVIDER --one-line
				rustormy -c "Goldsboro" --name --colors --lat "35.3336" --lon "-77.9404" --provider $PROVIDER --one-line
				echo
				;;
			*)
				echo
				rustormy -c "$CITY" --name --colors --lat "$LATITUDE" --lon "$LONGITUDE" --provider $PROVIDER --one-line
				echo -e "\n\n${B_BLUE}Full info  RDU, RMT (KSA), and KIN.\n ${B_WHITE}* ${YELLOW}weather-ksa ${B_WHITE}* ${YELLOW}weather-rdu ${B_WHITE}* ${YELLOW}weather-kin${NC}"
				echo -e "\n${B_BLUE}Quick info for  RDU, RMT (KSA), and KIN in a single line.\n ${B_WHITE}* ${YELLOW}outside-ksa ${B_WHITE}* ${YELLOW}outside-rdu ${B_WHITE}* ${YELLOW}outside-kin${NC}"
				echo -e "\n${B_BLUE}Info location set as default location set in rc file.\n ${B_WHITE}* ${YELLOW}outside${NC}\n\n"
				;;
		esac
	else
		echo -e "\nrustormy is not installed. \n Install rustormy or comment out the 'weather' function called in your shell rc or alias file.\n- https://github.com/Tairesh/rustormy/releases\n"
	fi

	#^ Full info aliases

	alias weather-ksa='rustormy -c "Riyadh" --name --colors --lat "24.6815" --lon "46.6214" --provider $PROVIDER'
	alias weather-rdu='rustormy -c "Raleigh" --name --colors --lat "35.8319" --lon "-78.5992" --provider $PROVIDER'
	alias weather-kin='rustormy -c "Goldsboro" --name --colors --lat "35.3336" --lon "-77.9404" --provider $PROVIDER'

	#^ Oneliner aliases

	alias outside-ksa='rustormy -c "Riyadh" --name --colors --lat "24.6815" --lon "46.6214" --provider $PROVIDER --one-line'
	alias outside-rdu='rustormy -c "Raleigh" --name --colors --lat "35.8319" --lon "-78.5992" --provider $PROVIDER --one-line'
	alias outside-kin='rustormy -c "Goldsboro" --name --colors --lat "35.3336" --lon "-77.9404" --provider $PROVIDER --one-line'

	#^ Quick outside weather check

	alias outside='outside-ksa'
}


#! - - - - - - !#

#*#    zellij aliases

zellij_aliases() {
	if [ -x "$(which zellij 2>/dev/null)" ]; then
		echo -e "\033[0;32m * \033[1;34mzellij\033[0;32m detected, creating aliases\033[0m"
		# Run zellij
		alias zell='zellij'
		# List sessions
		alias zell-ls='zellij list-sessions'
		# Attach to session
		alias zell-attach='zellij attach'
		alias zell-a='zellij attach'
		# Kill sessions
		alias zell-kill='zellij kill-session'
		alias zell-kill-all='zellij kill-all-sessions'
		# delete sessions
		alias zell-d='zellij delete-session'
		alias zell-d-all='zellij delete-all-sessions'
	fi
}

# zellij_aliases  #! Called in "zellij_setup()" function

#^#    Print useful info

print_zellij_aliases() {
    echo -e "\033[0;32m * \033[1;34mzellij\033[0;32m aliases \033[0m"
	echo -e "\033[0;32m    * \033[1;34mzell\033[0;32m to \033[1;34mzellij\033[0m"
	echo -e "\033[0;32m    * \033[1;34mzell-ls\033[0;32m to \033[1;34mzellij list-sessions\033[0m"
	echo -e "\033[0;32m    * \033[1;34mzell-a\033[0;32m to \033[1;34mzellij attach\033[0m"
	echo -e "\033[0;32m    * \033[1;34mzell-kill\033[0;32m to \033[1;34mzellij kill-session\033[0m"
	echo -e "\033[0;32m    * \033[1;34mzell-kill\033[0;32m to \033[1;34mzellij kill-all-session\033[0m"
}

# alias zellij-info='print_zellij_aliases' #! Set in "zellij_setup()" function

#^ #    Function to setaliases and notify user of zellij aliases

zellij_setup() {
    if [ -x "$(which zellij 2>/dev/null)" ]; then
        alias zellij-info='print_zellij_aliases'
        zellij_aliases
        echo -e "\033[0;32m * \033[1;34mZellij\033[0;32m detected, run \033[1;34mzellij-info\033[0;32m to view aliases\033[0m"
    fi
}

# zellij_setup #! Called at the bottom in the "Call "extras" functions" section

#!#     Uncomment and add to the bottom of this aliases file

#?#    Call zellij setup function if zellij is installed

# if [ -x "$(which zellij 2>/dev/null)" ]; then
#   zellij_setup
# fi

#! - - - - - !#

#*#    Docker swarm, ps, network, and image aliases

#^#    Docker aliases

dkr_aliases() {
	case "$1" in
		"ls")
			echo -e "\n${GREEN}Docker info:${NC}\n"
			docker ps -a --format "table {{.Names}}\t{{.Status}}"
			echo -e "\n${GREEN}Run ${CYAN}dkr ps-a ${GREEN}to see more information${NC}"
			echo -e "${GREEN}Run ${CYAN}docker ps --all${GREEN} for the full output${NC}\n"
		;;
		"ps")
			echo -e "\n${GREEN}Docker info:${NC}\n"
			docker ps -a --format "table {{.Names}}\t{{.Status}}"
			echo -e "\n${GREEN}Run ${CYAN}dkr ps-a ${GREEN}to see more information${NC}"
			echo -e "${GREEN}Run ${CYAN}docker ps --all${GREEN} for the full output${NC}\n"
		;;
		"ps-a")
			echo -e "\n${GREEN}Docker info:${NC}\n"
			docker ps -a --format "table {{.Names}}\t{{Image}}\t{{.Status}}\t{{Ports}}"
			echo -e "\n${GREEN}Run ${CYAN}docker ps -a${GREEN} for the full output${NC}\n"
		;;
		"img")
			echo -e "\n${GREEN}Docker images:${NC}\n"
			docker images -a --format "table {{.Repository}}\t{{.Tag}}"
			echo -e "\n${GREEN}Run ${CYAN}dkr image ${GREEN}to see more information${NC}"
			echo -e "${GREEN}Run ${CYAN}docker images${GREEN} for the full output${NC}\n"
		;;
		"image"|"img-a")
			echo -e "\n${GREEN}Docker images:${NC}\n"
			docker images -a --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.Size}}"
			echo -e "\n${GREEN}Run ${CYAN}docker images${GREEN} for the full output${NC}\n"
		;;
		"net")
			echo -e "\n${GREEN}Docker networks:${NC}\n"
			docker network ls --format "table {{.Name}}\t{{.Driver}}"
			echo -e "\n${GREEN}Run ${CYAN}dkr network ${GREEN}to see more information${NC}"
			echo -e "${GREEN}Run ${CYAN}docker network ls${GREEN} for the full output${NC}\n"
		;;
		"network"|"net-a")
			echo -e "\n${GREEN}Docker networks:${NC}\n"
			docker network ls --format "table {{.Name}}\t{{.ID}}\t{{.Driver}}\t{{.Scope}}"
			echo -e "\n${GREEN}Run ${CYAN}docker network ls${GREEN} for the full output${NC}\n"
		;;
		*)
			echo -e "\n${B_BLUE}Usage: dkr [ps|ps-a|img|image|net|network]${NC}\n"
            return 1
        ;;
    esac
}

# alias dkr='dkr_aliases' #! Set in "docker_setup()" function

#^#    Docker swarm drain and reboot local node

docker_swarm_set_drain_and_reboot_local_node() {
    echo -e "\n\033[1;31m* Rebooting node: $(hostname -f) ...\e[0m\n" ;
    #! Drain the local node
    docker node update --availability drain $(hostname -f) ;
    echo ;
    #! Reboot the node
    sudo reboot now ;
}

# alias node-rm='docker node rm --force' #! Set in "docker_setup()" function

#^#    Docker swarm drain local node aliases

docker_swarm_set_drain_local_node() {
    echo -e "\n\e[1;33m* Draining local node: $(hostname -f) ...\e[0m\n" ;
    #! Drain the local node
    docker node update --availability drain $(hostname -f) ;
    echo ;
    sleep 5 ;
    #! display node status
    docker node ls | \grep "$(hostname -f)" ;
    echo ;
}

#^#    Docker swarm set node active aliases

docker_swarm_set_active_local_node() {
    echo -e "\n\e[1;33m* Activating local node: $(hostname -f) ...\e[0m\n" ;
    #! Activate the local node
    docker node update --availability active $(hostname -f)
    echo ;
    sleep 5 ;
    #! display node status
    docker node ls | \grep "$(hostname -f)" ;
    echo ;
}

#^#    Docker swarm node aliases

docker_swarm_display_status_local_node() {
    echo -e "\n\e[1;33m* Swarm Cluster status:\e[0m" ;
    #! list the swarm nodes
    docker node ls ;
    echo -e "\n\e[1;33m* $(hostname -s) Status: \e[0m" ;
    #! display node status
    docker node ls | \grep "$(hostname -f)" ;
    echo ;
}

#^#    Docker node aliases

docker_node() {
    case $1 in
        "rm" | "remove" | "r" | "-rm" | "--remove" | "-r")
            echo -e "\n${B_RED}Removing node ${CYAN}$2${B_RED} from swarm cluster${NC}\n"
            docker node rm --force "$2"
            echo
        ;;
        "ls" | "l" | "list" | "-ls" | "-l" | "--list")
            docker_swarm_display_status_local_node
        ;;
        "reboot")
            docker_swarm_set_drain_and_reboot_local_node
        ;;
        "down" | "stop" | "drain" | "-d")
            docker_swarm_set_drain_local_node
        ;;
        "up" | "start" | "active"| "-a")
            docker_swarm_set_active_local_node
        ;;
        *)
            echo -e "\n${B_BLUE}Usage: node/dnode  [option]  <node_name>${NC}\n"
            echo -e "\n${BLUE} Remove node:${NC}"
            echo -e "${YELLOW}       node [rm|remove|r|down|-rm|--remove|-r|--down] <node_name>${NC}"
            echo -e "${BLUE}           - remove node from swarm cluster${NC}\n"
            echo -e "\n${BLUE} List nodes:${NC}"
            echo -e "${YELLOW}       node [ls|l|-ls|-l|--list]${NC}"
            echo -e "${BLUE}           - list local node status in swarm cluster${NC}\n"
            echo -e "\n${BLUE} Reboot local node:${NC}"
            echo -e "${YELLOW}       node reboot${NC}"
            echo -e "${BLUE}           - set local node to drain and reboot it${NC}\n"
            echo -e "\n${BLUE} Drain local node:${NC}"
            echo -e "${YELLOW}       node [down|stop|drain|-d]${NC}"
            echo -e "${BLUE}           - set local node to drain${NC}\n"
            echo -e "\n${BLUE} Set local node to active:${NC}"
            echo -e "${YELLOW}       node [up|start|active|-a]${NC}"
            echo -e "${BLUE}           - set local node to active${NC}\n"
            echo -e "\n${BLUE}Example:  ${GREEN}node rm node1${NC}"
            echo -e "${BLUE}Example:  ${GREEN}node ls${NC}"
            echo -e "${BLUE}Example:  ${GREEN}node reboot${NC}"
            echo -e "${BLUE}Example:  ${GREEN}node down${NC}"
            echo -e "${BLUE}Example:  ${GREEN}node up${NC}"
            echo -e "${BLUE}Example:  ${GREEN}node stop${NC}"
            echo -e "${BLUE}Example:  ${GREEN}node start${NC}"
            echo -e "${BLUE}Example:  ${GREEN}node active${NC}\n"
            echo
            return 1
        ;;
    esac
}

# alias node='docker_node' #! Set in "docker_setup()" function

#^#    Docker stack aliases

docker_stack() {
    case $1 in
        "rm" | "remove" | "r" | "down" | "-rm" | "--remove" | "-r" | "--down")
            echo -e "\n${B_RED}Removing stack ${CYAN}$2${NC}}\n"
            docker stack rm "$2"
            echo
        ;;
        "up" | "deploy" | "d" | "-up" | "--deploy" | "-d")
            if [ -z "$2" ]; then
                echo -e "\n${B_RED}Error: Stack name is required for deployment.${NC}\n"
                return 1
            fi
            echo -e "\n${B_BLUE}Deploying stack ${CYAN}$2${NC}\n"
            docker stack deploy -d -q -c docker-compose.yml "$2"
            echo
        ;;
        "ls" | "l" | "list" | "-ls" | "-l" | "--list")
            echo -e "\n${B_BLUE}Listing stacks in swarm cluster:${NC}\n"
            docker stack ls
            echo
        ;;
        "ps" | "status" | "-ps" | "--status")
            echo -e "\n${B_BLUE}Listing services in stack ${CYAN}$2${NC}\n"
            docker stack ps "$2"
            echo
        ;;
        *)
            echo -e "\n${B_BLUE}Usage: stack [option] {path} <stack_name>${NC}\n"
            echo -e "\n${BLUE} Remove Stack Commands:${NC}"
            echo -e "${YELLOW}       stack [rm|remove|r|down|-rm|--remove|-r|--down] ${CYAN}<stack_name>${NC}"
            echo -e "${BLUE}           - Remove stack from swarm cluster, same as ${GREEN}docker stack rm <stack_name>${NC}\n"
            echo -e "\n${BLUE} Deploy Stack Commands:${NC}"
            echo -e "${YELLOW}       stack [up|deploy|d|-up|--deploy|-d] ${MAGENTA}</path/to/docker-compose.yml> ${CYAN}<stack_name>${NC}"
            echo -e "${BLUE}           - Deploy stack to swarm cluster, same as ${GREEN}docker stack deploy -d -q -c /path/to/docker-compose.yml <stack_name>${NC}\n"
            echo -e "\n${BLUE} List Stack Commands:${NC}"
            echo -e "${YELLOW}       stack [ls|l|-ls|-l|--list]${NC}"
            echo -e "${BLUE}           - List stacks in swarm cluster, same as ${GREEN}docker stack ls${NC}\n"
            echo -e "\n${BLUE} Stack Service Status Commands:${NC}"
            echo -e "${YELLOW}       stack [ps|status|-ps|--status] ${CYAN}<stack_name>${NC}"
            echo -e "${BLUE}           - List services in stack, same as ${GREEN}docker stack ps <stack_name>${NC}\n"
            echo -e "\n${BLUE}Example:  ${GREEN}stack rm ${CYAN}<stack_name>${NC}"
            echo -e "${BLUE}Example:  ${GREEN}stack up ${MAGENTA}</path/to/docker-compose.yml> ${CYAN}<stack_name>${NC}"
            echo -e "${BLUE}Example:  ${GREEN}stack ls${NC}"
            echo -e "${BLUE}Example:  ${GREEN}stack ps ${CYAN}<stack_name>${NC}\n"
            echo
            return 1
        ;;
    esac
}

# alias stack='docker_stack' #! Set in "docker_setup()" function

#^#    Docker service aliases

docker_service() {
    case $1 in
        "ls" | "l" | "list" | "-ls" | "-l" | "--list")
            echo -e "\n${B_BLUE}Listing services in swarm cluster:${NC}\n"
            docker service ls --format "table {{.Name}}\t{{.Mode}}\t{{.Replicas}}\t{{.Ports}}"
            echo
        ;;
        "ps" | "status" | "-ps" | "--status")
            echo -e "\n${B_BLUE}Listing services in stack ${CYAN}$(echo "$2" | awk '{sub(/_.*$/,""); print}')${NC}\n"
            docker service ps "$2" --format "table {{.Name}}\t{{.Node}}\t{{.DesiredState}}\t{{.CurrentState}}\t{{.Error}}"
            echo
        ;;
        "update")
            echo -e "\n${B_BLUE}Updating service ${CYAN}$1${B_BLUE} in stack ${CYAN}$(echo "$1" | awk '{sub(/_.*$/,""); print}')${NC}\n"
            docker service update "$2" --force
            echo
        ;;
        *)
            echo -e "\n${B_BLUE}Usage: dserv [options] <stack_service_name>\n"
            echo -e "\n${BLUE} List Service${NC}"
            echo -e "${YELLOW}       dserv ls <stack_service_name>${NC}"
            echo -e "${BLUE}           - list services in swarm cluster, same as ${GREEN}docker service ls${NC}\n"
            echo -e "\n${BLUE} Service Status${NC}"
            echo -e "${YELLOW}       dserv ps <stack_service_name>${NC}"
            echo -e "${BLUE}           - list tasks in stack, same as ${GREEN}docker service ps <stack_service_name>${NC}\n"
            echo -e "\n${BLUE} Update Service${NC}"
            echo -e "${YELLOW}       dserv update <stack_service_name>${NC}"
            echo -e "${BLUE}           - update service in stack, same as ${GREEN}docker service update <stack_service_name>${NC}\n"
            echo -e "\n${B_BLUE}Example:  ${GREEN}dserv ls <stack_service_name>${NC}"
            echo -e "${B_BLUE}Example:  ${GREEN}dserv ps <stack_service_name>${NC}"
            echo -e "${B_BLUE}Example:  ${GREEN}dserv update <stack_service_name>${NC}\n"
            echo
            return 1
        ;;
    esac
}

# alias dserv='docker_service' #! Set in "docker_setup()" function

#^#    Print docker info

print_docker_alias_info() {
	if [ -x "$(which docker 2>/dev/null)" ]; then
		docker node inspect self > /dev/null 2>&1
		if [ $? -ne 0 ]; then
			#! Docker Aliases
			echo -e "\033[0;32m * \033[1;34mDocker\033[0;32m detected, creating aliases:\033[0m"
			echo -e "\033[0;32m   * \033[1;34mdocker ps\033[0;32m aliased to \033[1;34mdkr [ps|ps-a]\033[0m"
			echo -e "\033[0;32m   * \033[1;34mdocker image\033[0;32m aliased to \033[1;34mdkr [img|image]\033[0m"
			echo -e "\033[0;32m   * \033[1;34mdocker network\033[0;32m aliased to \033[1;34mdkr [net|network]\033[0m"
		else
			#! Docker Aliases
			echo -e "\033[0;32m * \033[1;34mDocker\033[0;32m detected, creating aliases:\033[0m"
			echo -e "\033[0;32m   * \033[1;34mdocker ps\033[0;32m aliased to \033[1;34mdkr [ps|ps-a]\033[0m"
			echo -e "\033[0;32m   * \033[1;34mdocker image\033[0;32m aliased to \033[1;34mdkr [img|image]\033[0m"
			echo -e "\033[0;32m   * \033[1;34mdocker network\033[0;32m aliased to \033[1;34mdkr [net|network]\033[0m"
			#! Docker Swarm Aliases
			echo -e "\033[0;32m * \033[1;34mDocker Swarm\033[0;32m detected, creating aliases:\033[0m"
			echo -e "\033[0;32m   * \033[1;34mdocker node\033[0;32m aliased to \033[1;34mnode\033[0m"
			echo -e "\033[0;32m   * \033[1;34mdocker stack\033[0;32m aliased to \033[1;34mstack\033[0m"
			echo -e "\033[0;32m   * \033[1;34mdocker service\033[0;32m aliased to \033[1;34mdserv\033[0m"
		fi
	fi
}

# alias dkr-info='print_docker_alias_info' #! Set in "docker_setup()" function

#^ #    Function to set aliases and notify user of docker aliases

docker_setup() {
    if [ -x "$(which docker 2>/dev/null)" ]; then
        alias dkr='dkr_aliases'
        alias node-rm='docker node rm --force'
        alias node='docker_node'
        alias dnode='docker_node'
        alias stack='docker_stack'
        alias dserv='docker_service'
        alias dkr-info='print_docker_alias_info'
        # echo -e "\033[0;32m * \033[1;34mDocker\033[0;32m detected, run \033[1;34mdkr-info\033[0;32m to view aliases\033[0m"
    fi
}

# docker_setup #! Called at the bottom in the "Call "extras" functions" section

#!#     Uncomment and add to the bottom of this aliases file

#^#    Call docker setup function if docker is installed

# if [ -x "$(which docker 2>/dev/null)" ]; then
#     docker_setup
# fi

#! - - - - - !#

#*# Portgen

#^# Function to setup portgen alias if portgen is installed
portgen_setup() {
    if [ -f "~/.scripts/portgen/portgen.sh" ]; then
        alias portgen='~/.scripts/portgen/portgen.sh'
    fi
}

# portgen_setup #! Called at the bottom in the "Call "extras" functions" section

#! - - - - - !#

#*# Call functions to test for various default app replacments and set aliases.

ls_setup
ripgrep_setup
bat_setup
batcat_setup

#! - - - - - !#

#*# Call "extras" functions, Uncomment as needed

#^# Call docker setup function if docker is installed

# if [ -x "$(which docker 2>/dev/null)" ]; then
#     docker_setup
# fi

#^# Call zellij setup function if zellij is installed

# if [ -x "$(which zellij 2>/dev/null)" ]; then
#     zellij_setup
# fi

#^# Call portgen setup function if portgen is installed

# portgen_setup

#! - - - - - !#

#*# Add a empty row after notifications and the prompt and reset colors

# echo -e "${NC}"

#! - - - - - !#

#*# Example

# echo "hello world"