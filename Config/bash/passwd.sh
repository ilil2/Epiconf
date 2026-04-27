#!/bin/sh

hash_sha256() {
	local input="$1"
	echo -n "$input" | sha256sum | cut -d' ' -f1
}

pwd_ask() {
	sleep 0.5
	read -sp "Password : " PASSWORD
	HASH_PASSWORD=$(hash_sha256 "$PASSWORD")
	SECURE_PASSWORD=$(cat ~/afs/.confs/.user)
	if [[ "$HASH_PASSWORD" == "$SECURE_PASSWORD" ]]; then
		echo 0
	else
		echo 1
	fi
}

trap_cmds() {
	if [ -f ~/afs/.confs/.user ]; then
		if [[ "$BASH_COMMAND" =~ \.c(o(n(f(s)?)?)?)?\*? || "$BASH_COMMAND" == *tag* ]]; then
			OUTPUT=$(pwd_ask)
			if [[ "$OUTPUT" == "1" ]]; then
				echo
				trap_cmds
			else
				echo
			fi
		fi
	fi
}

trap 'trap_cmds' DEBUG
