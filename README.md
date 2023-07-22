# ZoxeTweaks

This project exists to help me accomplish 3 goals:

  1. **Make AtrocityUI more visible to me.**  Fonts, chat panels, and a few other things here and there are just too small for me to see.  My eyes aren't what they used to be.
  2. **Fix WoW's absolutely busted scaling at 1440p.**  To get pixel-perfect WeakAuras, Atrocity's UI sets the global UI scale to a very small number.  As a side effect, all of the default Blizzard frames become very small.  This repo contains a small addon that manually scales individual frames without scaling `UIParent`.  This is intentional so I don't break the pixel-perfect scaling for WeakAuras.  There's probably a more elegant way to do this, so if you have ideas please share!
  3. **Support ultrawide gaming at 3440 x 1440.**  Details for this process can be found in the `1440p.txt` file.  Basically I manually apply every tweak each time Atrocity updates his UI.  I should automate this.  Maybe I will eventually.

This is a personal configuration + addon for my scenario.  I'm not placing this on any addon sites (CurseForge, etc).  This is just me sharing my setup with folks that asked me nicely on Atrocity's discord server.  YMMV, use at your own risk, and all that stuff.

I have not completely scaled every frame in the game.  I've just been scaling them as I encounter them.  I will update this code as I encounter more.

## Installation

- Make a new folder in your `Interface\AddOns` called `!ZoxeTweaks`
- Download a zip from this GitHub repo and extract the contents into your new `!ZoxeTweaks` folder.