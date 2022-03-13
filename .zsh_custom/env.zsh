
export PATH=/root/.local/bin:$PATH
export TERM=xterm-256color
export EDITOR=vim
export SYSTEMD_EDITOR=vim
export KEYTIMEOUT=1

unset  LSCOLORS
unset  LS_COLORS
LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
#export LS_COLORS="di=1;33:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

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

PROMPT=$'%{$purple%}%n${PR_RST} at %{$orange%}%m${PR_RST} in %{$grey%}%~${PR_RST} ${${KEYMAP/vicmd/"%F{196%} normal ${PR_RST}"}/(main|viins)/"%F{28%} insert ${PR_RST}"} $vcs_info_msg_0_$(virtualenv_info)
'