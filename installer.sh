#################
# Made with luv #
#################

echo "starting. --- Made by Mikus"

sudo apt update && sudo apt upgrade
sudo apt install wget apt-transport-https gnupg nano screen

echo "Setting up firewall"

sudo ufw status
sudo ufw allow OpenSSH
sudo ufw allow 25565
sudo ufw allow 19132
sudo ufw enable
sudo ufw status

echo "Installing Java and Git"
sudo apt install openjdk-17-jre-headless
java --version
sudo apt install git

echo "Beginning spigot install process"

cd ~
mkdir buildtools && cd buildtools
wget -O BuildTools.jar  https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -jar BuildTools.jar --rev latest
ls
echo "transfering files"
cd ~ && mkdir server && cd server
mv ~/buildtools/spigot-1.19.2.jar ~/server/spigot.jar

echo "Installing bootserver scripts..."
wget -O bootserver.sh https://raw.githubusercontent.com/mikusdev/Ubuntu-22.04-Minecraft-installer/main/bootserver.sh
./bootserver.sh

echo "Installing Geyser..."
cd ~/plugins
wget -O Geyser-Spigot.jar  https://ci.opencollab.dev//job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/build/libs/Geyser-Spigot.jar
