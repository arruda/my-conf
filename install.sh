#!/bin/sh
##############################################################################
# Copyright (c) 2012 Felipe Arruda Pontes
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
##############################################################################

#VAR CONFIGURATIONS
VIRTUALENV_DIR=~/.virtualenvs
PROJECTS_DIR=~/projetos
PROGRAMS_DIR=~/programas
INSTALLERS_DIR=~/instaladores
BIN_DIR=~/bin
OTHER_DIR=~/temp


#install the list of packages needed

#for drop down terminal
apt-get install -y guake

#edit guake with gconftool?

#fast acess to application
apt-get install -y gnome-do

###PYTHON-DEV
#install easy_install then pip
apt-get install -y python-setuptools python-dev build-essential
easy_install pip

#virtualenv
pip install virtualenv
pip install virtualenvwrapper

sudo -H -u arruda mkdir ${VIRTUALENV_DIR}
cat <<EOF >> ~/.bashrc
#PITHON
export PIP_RESPECT_VIRTUALENV=true
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages --distribute'
export WORKON_HOME=${VIRTUALENV_DIR}
source /usr/local/bin/virtualenvwrapper.sh~/.bashrc
EOF

#run for the first time the venvwarpper.
/usr/local/bin/virtualenvwrapper.sh

###PYTHON-DEV


#GIT

#git
apt-get install -y git-core

#gitconfig
cat <<EOF > ~/.gitconfig
[user]
    name = Felipe Arruda Pontes
    email = felipe.arruda.pontes@gmail.com
#[core]
#    editor = vim.tiny
[color]
    branch = auto
    diff = auto
    grep = auto
    interactive = auto
    status = auto

[alias]
    br = branch -a
    lg = log --graph --decorate=short --pretty=medium --abbrev-commit --date=local
    lgb = log --graph --decorate=short --pretty=medium --abbrev-commit --date=local --branches --all
EOF

#install sun java sdk, jre and plugins
#
#set the correct java
#

#make folder structures
sudo -H -u arruda mkdir ~/bin
cat <<EOF >> ~/.bashrc
export PATH=\$PATH:${BIN_DIR}
EOF

sudo -H -u arruda mkdir ${PROJECTS_DIR}
sudo -H -u arruda mkdir ${PROGRAMS_DIR}
sudo -H -u arruda mkdir ${INSTALLERS_DIR}
sudo -H -u arruda mkdir ${OTHER_DIR}
sudo -H -u arruda mkdir ${BIN_DIR}

####IDEs
cd ${INSTALLERS_DIR}
##install sublime text 2

wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.1%20x64.tar.bz2
tar -xvf Sublime\ Text\ 2*
mv Sublime\ Text\ 2 ${PROGRAMS_DIR}/SublimeText2
chmod +x ${PROGRAMS_DIR}/SublimeText2/sublime_text

#make simbolik link
ln -s ${BIN_DIR}/sublime ${PROGRAMS_DIR}/SublimeText2

#let it be found in gnome-do
cat <<EOF > ~/.local/share/applications/sublime.desktop
[Desktop Entry]
Encoding=UTF-8
Name=Sublime Text
Comment=Sublime Text IDE
Icon=${PROGRAMS_DIR}/SublimeText2/Icon/32x32/sublime_text.png
Exec=sublime
Terminal=false
Type=Application
StartupNotify=true
Categories=Application;Development;IDE
EOF

