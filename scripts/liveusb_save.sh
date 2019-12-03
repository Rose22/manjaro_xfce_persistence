#!/bin/bash

# LiveUSB persistence scripts (saving script) for Manjaro XFCE, made by Rose22 (https://www.github.com/Rose22)

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

cd `dirname $0`
mkdir persistence >/dev/null 2>&1
cd persistence
mkdir home >/dev/null 2>&1

rm -rf home/config
rm -rf home/mozilla
rm -rf home/local

cp -Rv $HOME/.mozilla home/mozilla
cp -Rv $HOME/.config home/config
cp -Rv $HOME/.local home/local

mkdir packages >/dev/null 2>&1
cp -Rvf /var/cache/pacman/pkg/* packages/

echo "Configuration saved."

