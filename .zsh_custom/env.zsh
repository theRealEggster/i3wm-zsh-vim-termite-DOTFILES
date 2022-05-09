# Helpless attempt att unblocking rfkill at boot:
rfkill unblock all
# Some export variables
export PATH=~/.local/bin:$PATH
export TERM=xterm-256color
export EDITOR=vim
export SYSTEMD_EDITOR=vim
export KEYTIMEOUT=1
export SUDO_ASKPASS=/usr/lib/ssh/ssh-askpass
export SSLKEYLOGFILE=~/.ssl-key.log

# Source kube-ps1 for kube status in PROMPT
source ~/.oh-my-zsh/plugins/kube-ps1/kube-ps1.plugin.zsh

# Rebind capslock to escape
setxkbmap -option caps:escape
# Enable Tap To Drag
xinput set-prop 11 350 1
# Enable Tap To Drag lock
xinput set-prop 11 352 1

# Start ssh-agent
SSH_ENV="$HOME/.ssh/agent-environment"
function start_agent {
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
}
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Custom bindings for bash like keybindings while in BOTH vim insert and command mode
# i.e ctrl+a to go to beginning of line and ctrl+e for end of line
# ctrl+d for delete, ctrl+f for backspace 
# ctrl+r for history search (ctrl+n for next command in history)
bindkey -M viins "^A" beginning-of-line
bindkey -M vicmd "^A" beginning-of-line
bindkey -M viins "^E" end-of-line
bindkey -M vicmd "^E" end-of-line
bindkey -M viins "^D" delete-char-or-list
bindkey -M vicmd "^D" delete-char
bindkey -M viins "^F" backward-delete-char
bindkey -M vicmd "^F" backward-delete-char
# In favor of ctrl+r searching history
#bindkey -M viins "^R" redo
bindkey -M viins "^U" undo
bindkey -M viins "^S" vi-change-whole-line
bindkey -M viins "^H" backward-delete-char
bindkey -M viins "^?" backward-delete-char
bindkey -M viins "^[[3~" delete-char
bindkey -M viins "^R" vi-history-search-backward
bindkey -M vicmd "^R" vi-history-search-backward
bindkey -M viins "^N" vi-repeat-search
bindkey -M vicmd "^N" vi-repeat-search
bindkey -M viins '^[^M' self-insert-unmeta



#unset  LSCOLORS
unset  LS_COLORS
#LSCOLORS=exfxcxdxbxegedabagacad
#export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
# Default manjaro ls colors. Works good with white background
export LS_COLORS="rs=0:di=01;33:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;36:*.tar=01;31::*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;20:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*.yaml=00;30:*.yaml-backup=00;30:*.log=00;30:*.sh=00;36"

# Set colors for use in prompt
if [[ $terminfo[colors] -ge 256 ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
    red="%F{196}"
    grey="%F{58}"
else
    turquoise="%F{cyan}"
    orange="%F{yellow}"
    purple="%F{magenta}"
    hotpink="%F{red}"
    limegreen="%F{green}"
    red="%F{196}"
    grey="%F{58}"
fi
PROMPT=$'%{$purple%}%n${PR_RST} at %{$orange%}%m${PR_RST} in %{$grey%}%~${PR_RST} ${${KEYMAP/vicmd/"%F{196%} normal ${PR_RST}"}/(main|viins)/"%F{28%} insert ${PR_RST}"} $vcs_info_msg_0_$(virtualenv_info) $(kube_ps1)
'
