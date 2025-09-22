git clone https://github.com/ilil2/My-Epita-Confs.git ~/epiconf
(
  cd ~/epiconf || exit 1
  chmod +x setup.sh
  ./setup.sh
)
rm -rf ~/epiconf
echo "rm"
