#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "" &&
echo -e "${GREEN}----------------------------" &&
echo "1.UPDATING AND REMOVING" &&
echo -e "----------------------------${NC}" &&
echo "" &&

sudo apt-get update &&
sudo apt-get upgrade -y &&
sudo apt-get install htop npm &&
sudo npm cache clean -f &&
sudo npm install -g n &&
sudo n stable &&

echo "" &&
echo -e "${GREEN}----------------------------" &&
echo "2.VISUAL STUDIO CODE CONFIGURATIONS" &&
echo -e "----------------------------${NC}" &&
echo "" &&

echo fs.inotify.max_user_watches=250000 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p &&

echo "" &&
echo -e "${GREEN}----------------------------" &&
echo "3.CLEANING" &&
echo -e "----------------------------${NC}" &&
echo "" &&

sudo apt-get autoclean -y
sudo apt-get autoremove -y

echo "" &&
echo -e "${GREEN}----------------------------" &&
echo "DONE, REBOOTING IN 10 SECONDS" &&
echo -e "----------------------------${NC}" &&
echo ""

for pc in $(seq 1 10); do
    echo -ne "${RED}."
    sleep 1
done

sudo reboot

