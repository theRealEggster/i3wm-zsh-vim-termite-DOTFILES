alias zalias='vim $ZSH_CUSTOM/alias.zsh'
alias zenv='vim $ZSH_CUSTOM/env.zsh'
alias zvars='vim $ZSH_CUSTOM/vars.zsh'
alias ls='ls --color=auto'
alias fuck='$(thefuck $(fc -ln -1))'
alias spac='sudo pacman -S $1'
alias upac='sudo pacman -Syu'
alias pac="sudo pacman"
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
alias -g G=' |LC_ALL=C grep -i'
alias bt="bluetoothctl "

function log { $* |& while read out; do echo "$(date '+[%y/%m/%d %H:%M:%S]')" "$out"; done |& tee ;}
p1ng() { ping $1 $2 |while read pong; do echo $(date +%T): $pong; done; }
rmssh() { sed -i".bak" '/'$1'/d' ~/.ssh/known_hosts; }
up() { for i in $(eval echo {1..$1}); do cd ..; done; }
count_char() { char=$(echo "$1" |wc -c); echo $(($char-1)); }
pwgen() { PW=$(cat /dev/urandom |LC_ALL=C tr -dc 'a-zA-Z0-9' |head -c 26); echo "26 Chars: $PW"; }

#dns_add() { 
#      echo "
#        key name key
#        server "DNS/IP"
#        zone "domain.com"
#        update add "$1".domain.com. 900 A "$2"
#        send" |nsupdate
#}
#}

#dns_remove() { 
#    echo "
#    key [zone] [key]
#    server "[IP/DNS]"
#    zone "[DOMAIN]"
#    update delete "$1".[DOMAIN]. A
#    send" |nsupdate
#}
