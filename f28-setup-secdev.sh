#!/bin/bash

#=======================================================================================================
#
# 	 FILE: f28-setup-sec-dev.sh
# DESCRIPTION: Post-installation script to wire up security and dev tools on Fedora28 workstation
#     WEBSITE:
#
#REQUIREMENTS: Fedora 28 installed on machine
#	 BUGS: ---
#	NOTES: This script attempts to increase efficiency and achieve consistency for installing 
#		dev tools for coding automated security tools for system and network admins using the 
#		Fedora 28 workstation, as well as smoothing out basic usability over the base install.
#		
#		After running the script:
#		- source .bashrc
#		- usermod -a -G vboxusers "username"
#	       
#	       -	
#	       -	
#
#  SHOUT-OUTS: 
#
#
#
#========================================================================================================

# Add basic aliases 
cat >>"$HOME/.bashrc" <<EOL
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

alias s='sudo'
alias upd8='s dnf update -y'
alias upgrA='s dnf upgrade -y'
alias upsec='upd8 && upgrA'
alias inst='s dnf install -y'

alias roll='shutdown -r now'
alias off='shutdown -h now'

alias sch='shutter &'
alias jup='jupyter notebook'
alias vbz='virtualbox &'
alias you='youtube-dl'
alias netz='speedtest-cli'
EOL
source .bashrc

echo "Adding repositories..."
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm || exit 1

echo "Updating Fedora..."
#upsec
sudo dnf update -y; sudo dnf upgrade -y

echo "Adding Security admin tools..."
sudo dnf -y group install 'Security Lab'
sudo pip install speedtest-cli
sudo dnf install -y keepassx

echo "Adding some vid capability..."
sudo dnf install -y vlc

echo "Adding Dev and Kernel hacking tools..."
cd /tmp/; git clone https://github.com/tomasr/molokai.git
sudo dnf install -y vim vim-plugin-powerline
sudo cp molokai/colors/molokai.vim /usr/share/vim/vim81/colors/

#source .bashrc
#need to find how to source .bashrc and utilize aliases immediately during script
#otherwise source .bashrc after script and you're in business
sudo dnf install -y automake gcc gcc-c++ kernel-devel cmake python-devel
sudo dnf -y group install "C Development Tools and Libraries"
sudo pip install --upgrade pip
sudo dnf install -y python-matplotlib
sudo pip install jupyter
sudo pip install scipy numpy sympy matplotlib

echo "Now for VirtualBox-5.2..."
sudo dnf install -y dkms patch
cd /etc/yum.repos.d/
sudo wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
sudo dnf update -y
cd
sudo dnf install -y VirtualBox-5.2
sudo /usr/lib/virtualbox/vboxdrv.sh setup

