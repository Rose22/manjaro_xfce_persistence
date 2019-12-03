#!/bin/bash

cd `dirname $0`

echo "Press Enter to proceed with the shutdown.."
read

./liveusb_save.sh

sudo shutdown now
