#!/usr/bin/env bash

# Version 0.1 22 September, 2019

# command line checks: 

# there should be ONE argument
if [ $# -ne 1 ]
then
    echo "ERROR: Incorrect usage"
    echo "correct usage: 'build.sh <MACHINE NAME>'"
    echo "(where <MACHINE NAME> is a single-word PC name of your choice)"
    echo "e.g. build.sh ManicMiner"
    exit 1
fi

ZIPDIR="/home/pi/Desktop/GITHUB/LeagueOfPi/TEST"

BASEDIR="/home/pi/LeagueOfPi"
mkdir -p $BASEDIR

if [ -d ${ZIPDIR}/LeagueOfPi-master ]
then
    echo "moving LeagueOfPi-master folder to ${ZIPDIR}/master"
    mv ${ZIPDIR}/LeagueOfPi-master ${BASEDIR}/master
else
    echo "can't find ${ZIPDIR}/LeagueOfPi-master - exiting"
    exit 3
fi

BUILDDIR="${BASEDIR}/master/BUILD"
PROJDIR="${BASEDIR}/master/Projects"
DLDIR="${BASEDIR}/master/Downloads"
LOGDIR="${BASEDIR}/master/Log"

mkdir -p $DLDIR
mkdir -p $LOGDIR

cd $BUILDDIR

exit

# set hostname in /etc/hostname (argument 1)
sudo mv /etc/hostname /etc/hostname.backup
cat hostname |  sed "s/_HOSTNAME_/${1}/" > hostname.tmp
sudo mv hostname.tmp /etc/hostname

# set hostname in /etc/hosts (argument 1)
sudo mv /etc/hosts /etc/hosts.backup
cat hosts |  sed "s/_HOSTNAME_/${1}/" > hosts.tmp
sudo mv hosts.tmp /etc/hosts

# temporarily set new hostname until reboot (argument 1)
sudo hostname ${1}

# create a desktop link to /media/pi
# NOTE: Raspbian Buster has now added desktop visibility of USB storage :D
# (now surplus to requirements but we'll retain it as a backup option)
if [ -L /home/pi/Desktop/BACKUP ]
then
    echo "/media/pi desktop link already exists. skipping this step..."
else
    echo "creating desktop symlink for /media/pi"
    sudo ln -s /media/pi /home/pi/Desktop/BACKUP
fi

# upgrade Raspbian
sudo apt-get update -y
sudo apt-get upgrade -y

# install useful software applications
sudo apt-get install mu -y
sudo apt-get install inkscape -y
sudo apt-get install gimp -y
sudo apt-get install audacity -y
sudo apt-get install vokoscreen -y
sudo apt-get install vlc -y


## download & install Processing3 (32 bit)
## V3.5.3 Linux 32 bit install - released 03 Feb 2019
if [ ! -f ${DLDIR}/processing-3.5.3-linux32.tgz ]
then
	/usr/bin/wget \
		-o ${LOGDIR}/processing.log \
		-O ${DLDIR}/processing-3.5.3-linux32.tgz \
		http://download.processing.org/processing-3.5.3-linux32.tgz
fi
cd $DLDIR
tar xvf processing-3.5-3-linux32.tgz >> ${LOGDIR}/processing.log
processing-3.5.3/install.sh >> ${LOGDIR}/processing.log


## download & install Google Blockly Games
if [ ! -f ${DLDIR}/blockly-games-en.zip ]
then
	/usr/bin/wget \
		-o ${LOGDIR}/blockly.log \
		-O ${DLDIR}/blockly-games-en.zip \
		https://github.com/google/blockly-games/raw/offline/generated/blockly-games-en.zip
fi
cd $DLDIR
unzip blockly-games-en.zip


## download & install Robocode
## TODO - menu item
if [ ! -f ${DLDIR}/robocode-1.9.3.7-setup.jar ]
then
	/usr/bin/wget \
		-o ${LOGDIR}/robocode.log \
		-O ${DLDIR}/robocode-1.9.3.7-setup.jar \
		https://sourceforge.net/projects/robocode/files/robocode/1.9.3.7/robocode-1.9.3.7-setup.jar/download
fi
cd $DLDIR
java -jar ${DLDIR}/robocode-1.9.3.7-setup.jar
mv /home/pi/robocode /home/pi/SMPSCodeClub/Download 


## download & install Twine 2.0 (32 bit)
if [ ! -f ${DLDIR}/twine_2.1.3_linux32.zip ]
then
	/usr/bin/wget \
		-o ${LOGDIR}/twine.log \
		-O ${DLDIR}/twine_2.1.3_linux32.zip \
		https://bitbucket.org/klembot/twinejs/downloads/twine_2.1.3_linux32.zip
fi
cd $DLDIR
unzip twine_2.1.3_linux32.zip


# add application icons to /usr/share/pixmaps
cd $BUILDDIR
sudo cp blockly.png /usr/share/pixmaps
sudo cp robocode.png /usr/share/pixmaps
sudo cp twine.png /usr/share/pixmaps


# add applications to the menu
cd $BUILDDIR
cp blockly.desktop /home/pi/.local/share/applications
cp robocode.desktop /home/pi/.local/share/applications
cp twine.desktop /home/pi/.local/share/applications