
import ST7735
from PIL import Image, ImageDraw
from os import path


# Create ST7735 LCD display class. If using ST7789, delete the st7735 coding. then uncomment the ST7789
    disp = ST7735.ST7735(
        port=0,
        cs=0,   #ST7735.BG_SPI_CS_FRONT,  # BG_SPI_CSB_BACK or BG_SPI_CS_FRONT
        dc=9,
        backlight=13,               
        rst=22,
        width=128,
        height=160,
        rotation=270,
        invert=False,
        spi_speed_hz=4000000
    )


disp.begin()
img = Image.new('RGB', (240, 240), color=(0, 0, 0))
draw = ImageDraw.Draw(img)
draw.rectangle((0, 0, 240, 240), (0, 0, 0))
disp.display(img)

disp.set_backlight(False)
