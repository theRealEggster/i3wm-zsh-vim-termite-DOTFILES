Full configuration files for my customized setup of i3wm

### ZSH ###
 +  ohmyzsh
 +  vim bindings for zsh with some keybinds kept from bash like 
    search through history with ctrl+r (ctrl+n for next suggestion)
    and going to start of line with ctrl+a and end of line with ctrl+e no mather what mode
    you are in (command/insert)
 + Multiline prompt
 
![Prompt](https://github.com/realMoonMoon/i3wm-zsh-vim-termite-DOTFILES/blob/main/Screenshots/prompt.png?raw=true)

### VIM ###
 + Backups enabled with every write, saved in ~/.vim/.backup
 + Auto completion of words
 + White theme called PaperColor due to me not being able to read white text on black backgrounds
   Can easily be switched by issuing "-c" in command mode for monokai theme
 + Edit .vimrc with, in command mode "-ev" and source the changes with "-sv"
 + Spell checking with, in command mode "-spell"

### Termite ###
 + Basic white background color with very readable colors
![Overlook](https://github.com/realMoonMoon/i3wm-zsh-vim-termite-DOTFILES/blob/main/Screenshots/terminal-windows.png?raw=true)
### i3wm ###
 + i3-gaps with a heavily modified config
 + Movement keys rebound to HJKL instead of JKL;
 + Close windows with $mod+q instead of $mod+Shift+q (although the 
 + Custom rofi launcher instead of dmenu, still bound to $mod+d
 ![rofi](https://github.com/realMoonMoon/i3wm-zsh-vim-termite-DOTFILES/blob/main/Screenshots/rofi.png?raw=true)

 + Easy keybind for opening up a floating vim window with $mod+Backspace
   and a specified starting directory making it easy to dump notes in one folder
 + Custom shell script for i3status
 + Battery left indicator via notify-send in a simple systemd service
   $mod+Shift+q works by killing the window under the mouse pointer
 + Take screenshots with $mod+p
 + Named workspaces for what goes on in each area
 + Auto start of applications via shell script "bin/startup" bound to $mod+s
   By clevere use of i3-msg and some sleep magic
   Due to applications spawning all over the place i let i3wm start up Firefox on it's own
   plus one Terminal. The script then spawns a second Terminal, Teams, Spotify, Google Chrome.
   All windows spawn on their assigned workspace
 + Blurlock instead of i3lock, a little fancier. Locks screen after suspend/hibernate and 
   after 15 minutes of AFK
 + Close dunst messages with $mod+space

### i3bar/i3status ###
 + Custom shell script ".config/i3/i3status.sh" that acts as a wrapper around i3status making it 
   possible to add the CPU temperature via "sensors" to the bar
 + Added name of the current day + week number to date field
 + Shows VPN status
 + Red battery indicator text if below 20%


### Systemd ###
 + How to enable battery notifications:
 + Copy service file and timer file to systemd user dir

$ sudo mv systemd/power* /etc/systemd/user/
+ Copy power script to /bin/

$ sudo cp bin/power.sh /bin/

+ Enable the power timer and service
systemctl --user enable power.timer 
systemctl --user start power.timer 
systemctl --user enable power.service
systemctl --user start power.service

+ Done, every 5 minutes a red nagging window will remind you of how much
  battery is left over

### SSH ###
 + Example of how to use sockets for ssh, so smooth

### Conky ###
Added configuration files for conky.
Its almost the same as default fori3-manjaro but updated with correct keybindings for my setup
![conky-info](https://github.com/theRealEggster/i3wm-zsh-vim-termite-DOTFILES/blob/main/Screenshots/conky-info.png?raw=true)
![conky-keybindings](https://github.com/theRealEggster/i3wm-zsh-vim-termite-DOTFILES/blob/main/Screenshots/conky-keybindings.png?raw=true)
