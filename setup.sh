hash_sha256() {
	local input="$1"
	echo -n "$input" | sha256sum | cut -d' ' -f1
}

config=~/afs/.confs
password_file=$config/.user

if [[ -f $password_file ]]; then
	sleep 0.5
	read -sp "Password : " PASSWORD
	HASH_PASSWORD=$(hash_sha256 "$PASSWORD")
	SECURE_PASSWORD=$(cat $config/.user)
	if [[ "$HASH_PASSWORD" == "$SECURE_PASSWORD" ]]; then
		echo 'Installing in progress'
	else
		echo 'fail wrong password'
		exit 1
	fi
else
	echo 'Installing in progress'
fi

cp -r Config/* $config
cp README.md $config/../EPICONF_HELPER.md
rm $password_file

read -p "Do you want a password for protect your config files? (y/[n])" WANTED

if [[ "$WANTED" == "Y" || "$WANTED" == "y" ]]; then
	read -sp "New Password         : " PASSWORD
	echo
	read -sp "Confirm New Password : " CONFIRM
	echo

	if [[ "$PASSWORD" == "$CONFIRM" ]]; then
		HASH_PASSWORD=$(hash_sha256 "$PASSWORD")
		touch $password_file
		echo "$HASH_PASSWORD" > $password_file

	else
		echo "Wrong Confirm Password, no password will be add"
	fi
fi

i3-msg reload
source $config/*
vim +PluginInstall +qall

echo 'EpiConf is succefully install'
