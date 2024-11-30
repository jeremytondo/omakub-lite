set -e

ascii_art='________                  __        ___.     .____    .__  __          
\_____  \   _____ _____  |  | ____ _\_ |__   |    |   |__|/  |_  ____  
 /   |   \ /     \\__  \ |  |/ /  |  \ __ \  |    |   |  \   __\/ __ \ 
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \ |    |___|  ||  | \  ___/ 
\_______  /__|_|  (____  /__|_ \____/|___  / |_______ \__||__|  \___  >
        \/      \/     \/     \/         \/          \/             \/ 
'

echo -e "$ascii_art"
echo "=> Omakub Lite is for fresh Ubuntu 24.04 installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Omakub Lite..."
rm -rf ~/.local/share/omakub-lite
git clone https://github.com/jeremytondo/omakub-lite.git ~/.local/share/omakub-lite >/dev/null
if [[ $OMAKUB_REF != "master" ]]; then
	cd ~/.local/share/omakub-lite
	git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakub-lite/install.sh
