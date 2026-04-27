### Playing songs in Lua

Firts of all you will need to convert you MIDI (or even MP3) file in a RTTTL file. This is necessary to play songs on robotics systems that have just a simple Buzzer.

The codes of this folder are examples and probably won't function in robotics systems without adaptions. But it works on any desktop. 

If you don't have SoX install it with: 

``` bash
sudo apt install sox
```
Now you're ready to listen Super Mario's theme:
``` bash
lua ./MarioTheme.lua
```