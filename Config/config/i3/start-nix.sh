echo "Starting config"
touch /tmp/tmp_flag
source ~/afs/.confs/epiconf/start.sh
rm /tmp/tmp_flag

source ~/afs/.confs/pkgs.sh
fc-cache -rf
echo "Epiconf is setup"