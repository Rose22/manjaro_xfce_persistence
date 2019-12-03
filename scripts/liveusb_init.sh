#!/bin/bash

# LiveUSB persistence scripts (loading script) for Manjaro XFCE, made by Rose22 (https://www.github.com/Rose22)

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# -------------------------------------------
# Configure the script here:
WIFI_SSID="placeholder"
MIRROR_COUNTRIES="United_States"
BLUETOOTH_ID="00:00:00:00:00:00 (placeholder)"

ENABLE_WIFI=TRUE
INSTALL_PACKAGES=TRUE
RESTORE_BLUETOOTH=FALSE
LAUNCH_PROGRAMS=FALSE
# -------------------------------------------

# CD into the directory the script is in
cd `dirname $0`
mkdir persistence >/dev/null 2>&1 
cd persistence

# Kill Manjaro Hello
killall python3
killall pamac-tray

clear

if [ $RESTORE_BLUETOOTH ]; then
	sudo pacman -U --noconfirm packages/bluez* 1>/dev/null
	sudo bluetooth on
	echo "Connecting Bluetooth device.. Please enable pairing mode on your device."
	sleep 8
	bluetoothctl pairable on
	bluetoothctl scan on &
	bluetoothctl trust $BLUETOOTH_ID
	sleep 5
	bluetoothctl connect $BLUETOOTH_ID &
	sleep 1
	bluetoothctl scan off

fi

clear

killall xfce4-panel
killall xfwm4
xfdesktop -Q
killall Thunar
sleep 1
killall xfconfd

echo "Copying settings.."
rm -rfv $HOME/.config/*
rm -rfv $HOME/.local/*
rm -rfv $HOME/.mozilla/*
cp -Rv home/config/* $HOME/.config/
cp -Rv home/local/* $HOME/.local/
mkdir ~/.mozilla/ >/dev/null 2>&1
cp -Rv home/mozilla/* $HOME/.mozilla/

echo "Done"

/usr/lib/xfce4/xfconf/xfconfd &
xfce4-panel &
xfwm4 &
xfdesktop &

clear

if [ $ENABLE_WIFI ]; then
	# Change when necessary
	nmcli device wifi connect $WIFI_SSID
fi

if [ $INSTALL_PACKAGES ]; then
	sudo pacman-mirrors -c "$MIRROR_COUNTRIES"
	sudo pacman -Syy
	sudo pacman -U --noconfirm packages/*
fi

cd ..
if [ $LAUNCH_PROGRAMS ]; then
	sleep 1
	./autostart_programs.sh
fi

