# Description
This is a set of scripts that can turn a LiveUSB Manjaro (XFCE edition) session, into a persistent session, without doing any modifications to the usb stick or to your installed operating system. No altering of partitions, nothing special is needed.

It does this by saving the configuration/settings of your live session into a directory in your chosen location, and when you next start up your liveUSB session, running the initialization script will then restore those settings, and you can continue using the liveUSB session as you left it.

Demonstration: https://youtube.com/watch?v=6lGY-csN5Ig

# How to use
To use it, place the program onto a harddrive in your computer, or onto another usb stick, or any other device that isn't the USB stick or ISO that you're running the Manjaro live session from. Extract the archive, and when you're in your LiveUSB session, install any packages you might need, change any settings to your preference, then run the "Save LiveUSB configuration" shortcut. It will now save your environment into the location you ran the script from.

From then on, every time you shut down and start the LiveUSB again, you will first be faced with the default session. But simply run the "LiveUSB initialization" shortcut, and it will restore the session for you, transforming it into what you had before you shut down the system.

In order to make sure your settings get saved when you shut down the system, either run the "Save LiveUSB configuration" shortcut and shut down, or for convenience, run "Save LiveUSB configuration and shut down".

A nice little trick is to put the saving/shutdown shortcut onto the Xfce panel for easy access. You'll have access to it every time you load into the persistent session.

The shortcuts point to several scripts in the script/ folder. You can also run those, but the shortcuts are there for your convenience. 

# Configuration
There are some values you can configure, within the script. Inside the scripts/ folder, edit the file "liveusb_init.sh". There, you can set a wifi point to automatically connect to, the country you live in (so it selects the proper mirrors for pacman), a bluetooth device to automatically connect to (in case you're using a bluetooth keyboard or mouse), and can toggle several functions of the process on and off.
