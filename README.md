# ZoxeTweaks

This project exists to help me accomplish 3 goals:

  1. **Make atrocityUI more visible to me.**  Fonts, chat panels, and a few other things here and there are just too small for me to see.  My eyes aren't what they used to be.
  2. **Fix WoW's absolutely busted scaling at 1440p.**  To get pixel-perfect WeakAuras, atrocityUI sets the global UI scale to a very small number.  As a side effect, all of the default Blizzard frames become very small.  This repo contains a small addon that manually scales individual frames **without** scaling `UIParent`.  This is intentional so I don't break the pixel-perfect scaling for WeakAuras.  There's probably a more elegant way to do this, so if you have ideas please share!
  3. **Support ultrawide gaming at 3440 x 1440.**  I have a bunch of settings that I like to tweak for all the various addons included with AtrocityUI (plus Shadow & Light).  I got tired of doing it manually, so I wrote a script.

I have not completely scaled every frame in the game.  I've just been scaling them as I encounter them.  I will update this code as I encounter more.

## Usage

Once installed, use the `/zt` command in-game to bring up the configuration options.  You'll also find it in the default Blizzard addon options.  If you chose to change the **scale factor**, please remember to reload your UI (or relog).

## AtrocityUI Tweaks

If you'd like to use my tweaks for atrocityUI, follow these steps whenever Atrocity releases a new version of his UI:

- Install the [atrocityUI pack](https://uipacks.wago.io/user/59dabe91b7ebeeaf72eec80a) of your choice.  You will need the [Wago App](https://addons.wago.io/app) for this.
- Run the atrocityUI installer: `/aui install` (highly recommended).
- Run ZoxeTweaks (`/zt`).  Choose which AtrocityUI Tweaks you'd like and click `Apply`.

## Getting Help

These tweaks are designed for the 1440p version of Atrocity UI.  **The 1080p version is not supported.**  I tend to hang around on [Atrocity's Discord server](https://discord.com/channels/458049769332539393/1172413353315008522).  If you run into issues, you're welcome to talk to me there.
