# ST7735-MoodeCoverArt 

*current version = "0.0.2"*
   * *includes option for 128x128 ST7735 displays [see config file]*

*old versions:*
   * *"0.0.1" - for 160x128 ST7735 only*

### Features.

The script will display cover art (where available) for the moode library or radio stations.

* For the moode library, embedded art will be displayed first, then folder or cover images if there is no embedded art.
* For radio stations, the moode images are used.
* If no artwork is found a default image is displayed.

Metadata displayed:
* Artist
* Album/Radio Station
* Title

There is also an option in config.yml to not display metadata

The script has a built in test to see if the mpd service is running. This should allow enough delay when 
used as a service. If a running mpd service is not found after around 30 seconds the script displays the following and stops.

```
   MPD not Active!
Ensure MPD is running
 Then restart script
```

**Limitations**

Metadata will only be displayed for Radio Stations and the Library.

For the `Airplay`, `Spotify`, `Bluetooth`, `Squeezelite` and `Dac Input` renderers, different backgrounds will display.

The overlay colours adjust for light and dark artwork, but can be hard to read with some artwork.

Shadow text is also optional.

The script does not search online for artwork

### Assumptions.

**You can SSH into your RPI, enter commands at the shell prompt, and use the nano editor.**

**Your moode installation works and produces audio**


### Preparation.

**Connecting ST7735 Dsiplay**

Connect display as shown in this image

![Connection Image](/pics/connections.jpg)

**Enable SPI pn your RPI**

see [**Configuring SPI**](https://learn.adafruit.com/adafruits-raspberry-pi-lesson-4-gpio-setup/configuring-spi)

Install these pre-requisites:
```
sudo apt-get update
sudo apt-get install python3-rpi.gpio python3-spidev python3-pip python3-pil python3-numpy
sudo pip3 install mediafile
sudo pip3 install pyyaml
```
Install the TFT driver.

```
sudo pip3 install ST7735
```

***Ensure 'Metadata file' is turned on in Moode System Configuration***

### Install the ST7735-MoodeCoverArt script

```
cd /home/pi
git clone https://github.com/rusconi/ST7735-MoodeCoverArt.git
```

### Config File

The config.yml file can be edited to:

* set overlay display options
* display the text with a shadow
* choose display width: 160 for 160x128, or 128 for 128x128 pixel displays

The comments in 'config.yml' should be self explanatory


**Make the shell scripts executable:**

```
chmod 777 *.sh
```

Test the script:

```
python3 /home/pi/ST7735-MoodeCoverArt/ST7735.py


Ctrl-c to quit
```

**If the script works, you may want to start the display at boot:**

### Install as a service.

```
cd /home/pi/ST7735-MoodeCoverArt
./install_service.sh
```

Follow the prompts.

If you wish to remove the script as a service:

```
cd /home/pi/ST7735-MoodeCoverArt
./remove_service.sh
```

***What to do if red and blue colours are reversed on the TFT.***

This will be obvious as the stopped icon will be blue instead of red.

I had to edit the '\_\_init\_\_.py' file of the st7735 driver as blue and red colours were reversed.  This is apparently common with some st7735 boards.

Here's how:

SSH into the rpi and...
````
sudo nano /usr/local/lib/python3.7/dist-packages/ST7735/__init__.py
````
locate the line that contains *`ST7735_MADCTL = 0x36`* and edit it to read *`ST7735_MADCTL = 0x00`*

Save the file and restart the script and the colours should be correct.
