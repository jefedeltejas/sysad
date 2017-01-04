# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

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
