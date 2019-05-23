#!/usr/bin/env bash

ANSIBLE_USER="ansible"
SUDO_FILE='/etc/sudoers.d/ansible'
SSH_PUBLIC_KEY=''

ANSIBLE_USER_HOME="/home/$ANSIBLE_USER"


if command -v python3 > /dev/null 2>&1
then
	echo 'python is already installed, skipping python installation'
	echo ''
else
	echo 'installing python'
	sudo apt-get -qq update; sudo apt-get -qq install python3 python3-pip -y
fi

if id -u "$ANSIBLE_USER" > /dev/null 2>&1
then
	echo 'ansible user already exists'
	echo ''
else
	echo 'creating ansible user'
	echo ''
	sudo adduser --disabled-password --quiet --gecos "" "$ANSIBLE_USER"
fi

if grep -Fxq "$ANSIBLE_USER ALL=NOPASSWD: ALL" "$SUDO_FILE"
then
	echo 'ansible user already in sudoers'
	echo ''
else
	echo 'adding ansible user to sudoers'
	echo ''
	echo "$ANSIBLE_USER ALL=NOPASSWD: ALL" | sudo tee -a "$SUDO_FILE" > /dev/null 2>&1
fi

if [[ "$SSH_PUBLIC_KEY" != '' ]]
then
	echo "adding SSH public key to $ANSIBLE_USER_HOME/.ssh/authorized_keys"
	echo ''	
	sudo mkdir -p "$ANSIBLE_USER_HOME/.ssh/"
	sudo echo "$SSH_PUBLIC_KEY" >> "$ANSIBLE_USER_HOME/.ssh/authorized_keys"
	sudo chmod 700 "$ANSIBLE_USER_HOME/.ssh/"
	sudo chmod 600 "$ANSIBLE_USER_HOME/.ssh/authorized_keys"
	sudo chown "$ANSIBLE_USER" "$ANSIBLE_USER_HOME/.ssh/"
	sudo chown "$ANSIBLE_USER" "$ANSIBLE_USER_HOME/.ssh/authorized_keys"
fi
