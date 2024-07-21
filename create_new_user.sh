#!/usr/bin/bash
echo Trying to create user ${1}

_USER=${1}

if [ -z ${_USER} ]; then
	echo error: user not provided
	exit 1
fi
id ${_USER}

if [ $? -eq 0 ]; then
	echo error: user ${_USER} exists 
	exit 1
elif [ $? -eq 1 ]; then
	useradd ${_USER} && echo user ${_USER} created
fi
_SSH_DIR=${HOME}/.ssh
_USER_HOME_DIR=$(awk -v u=${_USER} -v FS=':' '$1==u {print $6}' /etc/passwd)
_USER_SSH_DIR=${_USER_HOME_DIR}/.ssh
if [ -d ${_SSH_DIR} ]; then
	if [ ! -d ${_USER_SSH_DIR} ]; then
		mkdir ${_USER_SSH_DIR}
	fi
	for _FILE in $(ls ${_SSH_DIR})
	do
		cp ${_SSH_DIR}/${_FILE}  ${_USER_SSH_DIR}/.
		chown ${_USER}:${_USER} ${_USER_SSH_DIR}/${_FILE}
	done
fi
