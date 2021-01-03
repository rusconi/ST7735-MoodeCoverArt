#!/bin/bash

echo -e "Install ST7735-MoodeCoverArt Service. \n"
cd /home/pi/ST7735-MoodeCoverArt

while true
do
    read -p "Do you wish to install ST7735-MoodeCoverArt as a service?" yn
    case $yn in
        [Yy]* ) echo -e "Installing Service \n"
                sudo cp ST7735-moodecoverart.service /lib/systemd/system
                sudo chmod 644 /lib/systemd/system/ST7735-moodecoverart.service
                sudo systemctl daemon-reload
                sudo systemctl enable ST7735-moodecoverart.service
				echo -e "\ST7735-MoodeCoverArt installed as a service.\n"
                echo -e "Please reboot the Raspberry Pi.\n"
                break;;
        [Nn]* ) echo -e "Service not installed \n"; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true
do
    read -p "Do you wish to reboot now?" yn
    case $yn in
        [Yy]* ) echo -e "Rebooting \n"
                sudo reboot
                break;;
        [Nn]* ) echo -e "Not rebooting \n"
                break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "ST7735-MoodeCoverArt install complete"