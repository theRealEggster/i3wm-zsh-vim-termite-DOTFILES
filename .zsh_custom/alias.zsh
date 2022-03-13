#export PATH=/home/kimlin/.local/bin:$PATH
#export EDITOR=vim
#stty erase  



#alias zalias='vim $ZSH/custom/alias.zsh'
#alias ls='ls --color=auto'
#alias fuck='$(thefuck $(fc -ln -1))'
#alias spac='sudo pacman -S $1'
#alias upac='sudo pacman -Syu'
#alias pac="sudo pacman"
#alias ownitvpn='sudo openvpn --cd /etc/openvpn/client --config client.ovpn --log-append log --daemon openvpn'
#alias changemac='sudo ip link set dev enp3s0 down &&  sudo ip link set dev enp3s0 address $1 && sudo ip link set dev enp3s0 up'
#alias g='zgrep -if $1'
#alias 1log='cd /var/log'
#alias ='stty erase \^\?'
#alias ='stty erase \^\H'
#alias pat='pygmentize -g'
#alias -g L=' |less'
#alias -g V=' |vim -'
#alias -g G=' |LC_ALL=C grep -i'
#alias bt="bluetoothctl "
#alias timerep='vim ~/work/vim/TIME/timereport'

#function log { $* |& while read out; do echo "$(date '+[%y/%m/%d %H:%M:%S]')" "$out"; done |& tee ;}
#p1ng() { ping $1 $2 |while read pong; do echo $(date +%T): $pong; done; }
#rmssh() { sed -i".bak" '/'$1'/d' ~/.ssh/known_hosts; }
#up() { for i in $(eval echo {1..$1}); do cd ..; done; }
#count_char() { char=$(echo "$1" |wc -c); echo $(($char-1)); }
#pwgen() { PW=$(cat /dev/urandom |LC_ALL=C tr -dc 'a-zA-Z0-9' |head -c 26); echo "26 Chars: $PW"; }

#ojnit_add() { 
#      echo "
#        key agamaupdate 5F1f3UzSn5sidnGfjMAsLg==
#        server "37.247.0.22"
#        zone "ojnit.se"
#        update add "$1".ojnit.se. 900 A "$2"
#        send" |nsupdate
#}
#agama_add() { 
#      echo "
#        key [zone] [key]
#        server "37.247.0.22"
#        zone "agama.ownit.se"
#        update add "$1".agama.ownit.se. 900 A "$2"
#        send" |nsupdate
#}

#ojnit_del() { 
#    echo "
#    key [zone] [key]
#    server "37.247.0.22"
#    zone "ojnit.se"
#    update delete "$1".ojnit.se. A
#    send" |nsupdate
#}
