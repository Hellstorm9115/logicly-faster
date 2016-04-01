# Logic.ly Faster

A utility for connecting [Logic.ly](http://logic.ly/) nodes faster, and maybe more.

![Logic.ly Faster Demo GIF](https://raw.githubusercontent.com/fyodorjung/logicly-faster/master/demo-in-action.gif)

This utility has only been tested for [the free web demo](http://logic.ly/demo/), not the desktop application.

## Usage

 1. Install [AHK (AutoHotkey)](https://autohotkey.com/).
 2. Open up `logicly-faster.ahk` in AHK. (The installer may have already associated .ahk files accordingly. If not, right-click and "Open with..."
 
    ![Logic.ly Faster Demo GIF](https://raw.githubusercontent.com/fyodorjung/logicly-faster/master/demo-opening-the-script.png)
    
    If you see a green "H" icon in your systray (on the Windows taskbar, near the clock), then you've succeeded, probably.
    
 3. Make sure you're in selection (pointer) mode and not the pan (hand) mode.
 
    ![Logic.ly Faster Demo GIF](https://raw.githubusercontent.com/fyodorjung/logicly-faster/master/demo-selection-tool.png)
    
 4. Press Ctrl+Shift+L, and follow the remaining instructions.
 
---
 
### Notes

Don't get scared off by AHK. AHK is just a lightweight utility for automating actions on Windows. (If you've ever worked with Excel macros, it's like that.) For example, with AHK, you can write a script that goes, _"Whenever Ctrl+Alt+H is pressed, open up my browser and go to [http://hasthelargehadroncolliderdestroyedtheworldyet.com](http://hasthelargehadroncolliderdestroyedtheworldyet.com)."_ Another thing AHK can do though, is automate mouse movements. So we can write a script that goes, _"Move the mouse to (a,b), click, and while holding click (to drag), move the mouse to (x,y), and let go."_ and so on. That's basically how this utility does what it does, faster than you.

### Tips

These aren't related to this utility, but perhaps helpful any Logic.ly user.

 - Find the settings (fear) icon in the upper-right corner, and enable Snap to Grid.
 
 - You can copy and paste multiple components at a time. If you need 16 switches for example, create 2 switches, copy both and paste to double your switches, etc. Sometimes Ctrl+C doesn't work; use the right-click menu instead.

### Support

 - If the utility is missing a few connections here and there, try these things. (1) Open up `logicly-faster.ahk` in Notepad or whatever editor you'd like, find the line `LogiclySexySpeed := 20`, and increase that number, to say, 100. If that worked, then work your way down until you find the fastest your machine can handle without missing nodes. (2) Are you trying to hook up alternating nodes on a component? If so, are you selecting the first and last nodes of that component? If so, that would be your problem. If you're trying to connect 8 nodes on a 16-node component, for example, you need to select the first and the 15th nodes, not the first and the 16th nodes. (3) See below:
 
 - Email me; should be on [my profile](https://github.com/fyodorjung). I'll respond within `2 ^ (CurrentYear - 2015) * 24` hours, with a probability of less than 1.

### Contribute!

Here are some ideas, if you'd like to contribute to this project.

 - There's currently no way to select a group of wires, making deletion tedious. Write an AHK function that takes two mouse coordinates (determined by the user), then scans the line between for any red pixels, clicking and deleting at every such pixel.
 
 - Currently the speed parameter needs to be adjusted on a per-machine basis, and is a lazy workaround to the fact that when the script runs too fast, Logic.ly misses connections because it's not done wiring up the previous nodes when the script has already matched up the next two. Is there a way to detect when the wires finish "connecting" so that we can always wait _just_ long enough (not more, not less) before pairing up the next two nodes?
 
 - I was able to select-all, copy, use Free Clipboard Viewer to export the raw clipboard data, delete everything (in Logic.ly), copy some dummy text (for good measure), import the clipboard data from before, and paste, to find everything restored. Unfortunately, this didn't work once refreshing the session. If someone can figure out how to reproduce this ability cross-session, we should be able to create an AHK script that essentially allows saving.