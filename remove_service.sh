#!/bin/bash
 
echo -e "Remove ST7735-MoodeCoverArt Service\n"


while true
do
    read -p "Do you wish to Remove ST7735-MoodeCoverArt as a service?" yn
    case $yn in
        [Yy]* ) echo -e "Removing Service \n"
                sudo systemctl stop ST7735-moodecoverart.service
                sudo systemctl disable ST7735-moodecoverart.service
                sudo rm /etc/systemd/system/ST7735-moodecoverart.service
                sudo systemctl daemon-reload
                sudo systemctl reset-failed
				echo -e "\nST7735-MoodeCoverArt removed as a service.\n"
                echo -e "Please reboot the Raspberry Pi.\n"
                break;;
        [Nn]* ) echo -e "Service not removed \n"; break;;
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

echo "ST7735-MoodeCoverArt service removal complete"