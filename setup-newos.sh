sudo apt-get install vim terminator ssh openssh-server make build-essential
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
sudo apt install git
sudo apt install curl
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
curl -L https://go.microsoft.com/fwlink/p/?LinkID=2112886&clcid=0x418&culture=ro-ro&country=RO --ouput teams_1.3.00.25560_amd64.deb
sudo dpkg -i teams_1.3.00.25560_amd64.deb
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.7.0-amd64.deb
sudo dpkg -i slack-desktop-4.7.0-amd64.deb
rm slack-desktop-4.7.0-amd64.deb
sudo snap install discord
