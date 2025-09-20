#!/bin/sh

echo "EPITA Config Reset Starting ---"

echo "Cloning default config from Github..."
git clone https://github.com/epita/epita-default-configs.git ~/afs/default_conf/ &> /dev/null

if [ $? -ne 0 ]; then
  echo "ERROR: Failed to clone default config. Check your internet connection."
  exit 1
fi

echo "Removing old configuration files ---"
echo "Removing tmp_flag..."
rm ~/afs/../tmp_flag

echo "Removing EPICONF_HELPER.md..."
rm ~/afs/EPICONF_HELPER.md

echo "Removing .confs..."
rm -rf ~/afs/.confs

echo "Installing default configuration ---"
mv ~/afs/default_conf/ ~/afs/.confs/

echo "Process Complete ---"
echo "Configuration reset successful!"
echo "Please open a new terminal for the changes to take effect."