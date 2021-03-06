Full configuration files for my customized setup of i3wm

### ZSH ###
 +  ohmyzsh
 +  vim bindings for zsh with some keybinds kept from bash like 
    search through history with ctrl+r (ctrl+n for next suggestion)
    and going to start of line with ctrl+a and end of line with ctrl+e no mather what mode
    you are in (command/insert)
 + Multiline prompt
 
![Prompt](https://github.com/theRealEggster/i3wm-zsh-vim-termite-DOTFILES/blob/5f7fad74794b469e94f7fe7d0cf6f1b203e20ac9/Screenshots/Screenshots-2022-06-01_0829.png?raw=true)

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
 + i3-gaps with a heavily modified config. Like a red outline of the active window.
 + Movement keys rebound to HJKL instead of JKL;
 + Close windows with $mod+q instead of $mod+Shift+q (although the $mod+shift+q kills the mouseover window)
 + Custom rofi launcher instead of dmenu, still bound to $mod+d
 ![rofi](https://github.com/realMoonMoon/i3wm-zsh-vim-termite-DOTFILES/blob/main/Screenshots/rofi.png?raw=true)

 + Easy keybind for opening up a floating vim window with $mod+Backspace
   and a specified starting directory making it easy to dump notes in one folder
 + Uses i3blocks instead of i3status. Couldnt figure out how to include the blocklets though. 
   Download them with: git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks

 + Battery left indicator via notify-send in a simple systemd service
 + Take screenshots with $mod+p
 + Named workspaces for what goes on in each area
 + Auto start of applications via shell script "bin/startup"
   By clevere use of i3-msg and some sleep magic
   Due to applications spawning all over the place i let i3wm start up Firefox on it's own
   plus one Terminal. The script then spawns a second Terminal, Teams, Spotify, Brave browser
   All windows spawn on their assigned workspace
 + Blurlock instead of i3lock, a little fancier. Locks screen after suspend/hibernate and 
   after 15 minutes of AFK
 + Close dunst messages with $mod+space

### i3bar/i3blocks ###
 + Added name of the current day + week number to date field + clickable for a calendar pop up
 + Shows VPN status if active
 + Red battery indicator text if below 20%


### Systemd ###
 + How to enable battery notifications:
 + Copy service file and timer file to systemd user dir
 + power.cfg is a battery notification that run with the systemd profiles further down

 + Copy this script to autostart programs on boot

$ cp .local/bin/startup ~/.local/bin/

$ sudo mv systemd/power* /etc/systemd/user/

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
