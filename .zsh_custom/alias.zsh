alias zalias='vim $ZSH_CUSTOM/alias.zsh'
alias zenv='vim $ZSH_CUSTOM/env.zsh'
alias zvars='vim $ZSH_CUSTOM/vars.zsh'
alias ls='ls --color=auto'
alias fuck='$(thefuck $(fc -ln -1))'
alias spac='sudo pacman -S $1'
alias upac='sudo pacman -Syu'
alias pac="sudo pacman"
alias rmsocket="rm -f .ssh/sockets/*"
#alias ovpn_start='sudo openvpn --cd /etc/openvpn/client --config client.ovpn --log-append log --daemon openvpn'
alias changemac='sudo ip link set dev wlp2s0 down &&  sudo ip link set dev wlp2s0 address $1 && sudo ip link set dev wlp2s0 up'
# Set alias for grep -ZFi for easier grepping. 
alias g='zgrep -iF $1'
alias 1log='cd /var/log'
# Fix backspace 
alias ='stty erase \^\?'
alias ='stty erase \^\H'
alias pat='pygmentize -g'
alias -g L=' |less'
alias -g V=' |vim -'
alias -g G=' |LC_ALL=C grep -iE'
alias so="source ~/.zshrc"
alias s=sudo
alias sv="sudo vim"
alias tp="trash-put"


