#!/bin/bash
###############################################################################
#   Copyright (C) 2021-2021 Shane Daley, M0VUB <support@gb7nr.co.uk>
#   Copyright (C) 2021-2021 Ben A. Fogt, N5AMD <N5AMD.COM>
#   Thanks to Ben for providing original script for YSFReflector.
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software Foundation,
#   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
###############################################################################

#https://register.ysfreflector.de/installation
#Step 1: Install Debian 9, 10, 11 and make sure it is up to date.
#Step 2: Run this script
#Step 3: Use systemd to control the service (systemctl start | stop | status | restart ysf
# systemctl status ysfreflector
#Lets start-------------------------------------------------------------------------------
WHO=$(whoami)
if [ "$WHO" != "root" ]
then
  echo ""
  echo "You Must be logged in as root to run this script!!"
  exit 0
fi
if [ ! -e "/etc/debian_version" ]
then
  echo ""
  echo "This script is only tested in Debian/Ubuntu 9,10 & 11 x64 cpu Arch. Check System!!"
  exit 0
fi
DIRDIR=$(pwd)
YSFREPO=https://github.com/ShaYmez/pYSFReflector.git
YSFDASHREPO=https://github.com/dg9vh/YSFReflector-Dashboard.git
DEP="wget git python3 python3-pip apache2 php libapache2-mod-php"
YSFINSTDIR=/root/reflector-install-files/ysfreflector
YSFAPPDIR=/ysfreflector
YSFDASDIR=/root/reflector-install-files/ysfdash
YSFWEBDIR=/var/www/ysf
#requirements.txt install
