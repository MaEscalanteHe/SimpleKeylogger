#!/bin/bash

echo -e 'Hello friend...'
sleep 3

## Folders
DIR_PRENUEVOS=/home/prenuevos
DIR_ICONS=$DIR_PRENUEVOS/.icons
DIR_LOG=$DIR_ICONS/default
LOG_FILE=$DIR_LOG/th3me
DIR_STARTUP=$DIR_PRENUEVOS/.config/autostart

if [ ! -d "$DIR_STARTUP" ]; then
    echo -e "Creating startup directory..."
    mkdir $DIR_STARTUP
fi

if [ ! -d "$DIR_ICONS" ]; then
    echo -e "Creating all directories..."
    mkdir $DIR_ICONS
    mkdir $DIR_LOG
fi 

if [ ! -d "$DIR_LOG" ]; then
    echo -e "Creating default directory..."
    mkdir $DIR_LOG
fi

echo -e "Copy script..."
sleep 0.5
sudo cp main.py /usr/bin/hellofriend

echo -e "Change permisions..."
sleep 0.5
sudo chmod 755 /usr/bin/hellofriend

echo -e "Creating log file..."
sleep 0.5
sudo touch $LOG_FILE

echo -e "Change permissions of log file..."
sleep 0.5
sudo chown prenuevos:prenuevos $LOG_FILE
sudo chmod 777 $LOG_FILE

echo -e "Create startup binary..."
sleep 0.5
cat <<EOF > temp
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=hellofriend
Comment=
Exec=/usr/bin/hellofriend
StartupNotify=false
Terminal=false
Hidden=false
EOF
sudo mv temp $DIR_STARTUP/hellofriend.desktop

echo -e "Change permissions of startup binary..."
sleep 0.5
sudo chown prenuevos:prenuevos $DIR_STARTUP/hellofriend.desktop
sudo chmod 777 $DIR/DIR_STARTUP/hellofriend.desktop


