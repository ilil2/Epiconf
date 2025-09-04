hash_sha256() {
	local input="$1"
	echo -n "$input" | sha256sum | cut -d' ' -f1
}

read -sp "Password         : " PASSWORD
echo
read -sp "Confirm Password : " CONFIRM
echo

if [[ "$PASSWORD" == "$CONFIRM" ]]; then
	config=~/afs/.confs
	cp -r Config/* $config
	cp README.md $config/EPICONF_HELPER.md

	HASH_PASSWORD=$(hash_sha256 "$PASSWORD")
	sed -i "s/SECURE_PASSWORD/$HASH_PASSWORD/" "$config/bashrc"

	i3-msg reload
	source $config/*
	vim +PluginInstall +qall

else
	echo "Wrong Password"
fi
