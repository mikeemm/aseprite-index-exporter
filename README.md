# Aseprite Index Exporter
Aseprite script for exporting indices instead of colors when using indexed color mode.

## Why?
Aseprite's indexed color mode allows you to reference colors from your palette instead of directly drawing colors into your sprite. This means that changing your palette will automatically update the colors of your sprite, which is really useful in case you want to render the same images with different color schemes - but only within Aseprite, as the exported image will be saved with the indices translated into the palette colors.

This script allows you to create sprites for your own game or software while still being able to change palettes without going back to Aseprite, by exporting the sprite's indices as a grayscale image that can then be mapped into any palette (which you can also create with Aseprite) all within your own program.

## How?
Download '**Index Exporter.lua**' and save it on Aseprite's **Scripts** folder, then simply select it from the Scripts menu. Be sure to reload the Scripts folder so it appears in the list.

You should get a small menu like below:

![image](https://github.com/user-attachments/assets/0a3f4179-2cf3-4e20-b886-daa78a4eb38e)

## Current Limitations?
- Only *PNG*s are supported.
- Only the first frame is exported.
- Palettes can not have more than 256 colors, including the background color.
- All the other regular export options are unavailable (changing the render region, selecting layers, animation settings, sprite sheets).
