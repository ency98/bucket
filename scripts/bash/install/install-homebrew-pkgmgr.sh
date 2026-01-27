#!/usr/bin/env bash

#! Functions
_CHECK_LAST_COMMAND() {
	local MESSAGE=$1
	if [[ $? -ne 0 ]]; then
		echo -e "\n\n$MESSAGE\n\n"
		exit 1
	fi
}

_install_homebrew() {
	echo -e "\n Installing Homebrew Package Manager.\n"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo >> /home/admwilsonb/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> /home/admwilsonb/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
	sudo apt-get install build-essential
	brew install gcc
}

if ! command -v brew &> /dev/null; then
	_install_homebrew
else
	echo -e "\n Homebrew is already installed.\n"
	exit 0
fi

echo -e "\n\n----------------------------------------------
  Homebrew Package Manager installed.
----------------------------------------------\n"