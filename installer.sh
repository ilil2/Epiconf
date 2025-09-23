git clone https://github.com/ilil2/Epiconf.git ~/epiconf
(
  cd ~/epiconf || exit 1
  chmod +x setup.sh
  ./setup.sh || true
)
rm -rf ~/epiconf
echo "rm"
