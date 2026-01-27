# Bash - Commands, strings, functions, and info

Various
- Bits of info
- Commands
- Strings
- bash/zsh options
- Syntax examples
-

![alt text](image.png)

Cause I can't remember shit.

## wget
Download and run.shus in with wget
`bash -c "$(wget -qLO - http://host.domain.tld/scripts/script.sh)"`

## SSH

### ssh-keygen (id_ed25519)
`sudo -u $USER ssh-keygen -t ed25519 -f /home/$USER/.ssh/id_ed25519 -N ''`