This build of League of Pi contains the following added
software installed into the menu system:


Inkscape	Graphics	vector graphics
GIMP		Graphics	image processing
Audacity	Sound & Video	audio processing
Vokoscreen	Sound & Video	screen recorder (video)
VLC		Sound & Video	media player
Mu		Programming	python/micropython editor
Google Blockly	Programming 	coding puzzles/games
Processing	Programming	code-controlled graphics/animation 
Robocode	Programming	java-based autonomous robot battle
Twine		Programming	non-linear story creation


Instructions for creating a "League Of Pi" laptop build.


[1] Download the latest Raspbian X86 desktop image:

https://www.raspberrypi.org/downloads/raspberry-pi-desktop/

THIS IS A VERY LARGE FILE (>2GB). WE STRONGLY RECOMMEND THAT 
YOU USE AN ETHERNET CONNECTION FOR SPEED AND RESILIENCE.


[2] Burn this onto a USB stick using etcher:

https://www.balena.io/etcher/


[3] Install the image to your laptop:

a. plug your USB stick into your laptop (powered down)
b. power your laptop on and boot it into the USB media 
NOTE: USB boot is a setting you will find in your BIOS
c. select graphical install
d. accept all default settings
e. ignore complaints about missing licensed components


[4] Open a terminal and type "cd /home/pi/Desktop"


[5] Download the repository. In the same terminal window, type:

wget https://github.com/SMPSCodeClub/LeagueOfPi/archive/master.zip

THIS COMMAND DOWNLOADS A LARGE FILE (15MB). WE STRONGLY RECOMMEND 
THAT YOU USE AN ETHERNET CONNECTION FOR SPEED AND RESILIENCE.


[6] Once the download has completed, type "unzip master.zip"


[7] Choose a NAME for your laptop and run the build script:

e.g. ./LeagueOfPi-master/BUILD/build.sh ManicMiner

THIS SCRIPT DOWNLOADS SOME LARGE FILES. WE STRONGLY RECOMMEND 
THAT YOU USE AN ETHERNET CONNECTION FOR SPEED AND RESILIENCE.

Now wait as the build script does the following:

1. renames your laptop
2. updates the OS (apt-get update; apt-get upgrade)
3. adds /media/pi symlink to desktop (for ease of finding USB media) 
4. installs additional offline goodies (e.g. Inkscape, GIMP...)
5. adds applications to the menu system
6. installs a Projects folder on the desktop containing offline project materials

NOTES:

1. the script contains very little sanity checking of the downloaded 
content - if it fails or is incomplete, subsequent commands that 
presume a successful download will throw up errors. Sanity checking
of downloads will be added in a future version.

2. the terminal may be silent for long periods of time (many minutes)
while some files are being downloaded using wget (Processing, Robocode, 
Google Blockly, Twine). During these "silent" periods you can confirm 
that the downloads are progressing by examining the contents of the 
wget logs using e.g. 'less' these are being written in the 
/home/pi/LeagueOfPi/master/Log folder.
