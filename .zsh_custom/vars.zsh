rfkill unblock all

alias fuck='$(thefuck $(fc -ln -1))'
alias zalias='vim $ZSH_CUSTOM/vars.zsh'
alias 'stty erase \^\?'
alias 'stty erase \^\H'
alias ls='ls --color=auto'
alias ll='ls -laF --color=auto'
alias fuck='$(thefuck $(fc -ln -1))'
alias spac='sudo pacman -S $1'
alias upac='sudo pacman -Syu'
alias pac="sudo pacman"
alias changemac='sudo ip link set dev enp3s0 down &&  sudo ip link set dev enp3s0 address $1 && sudo ip link set dev enp3s0 up'
alias g='zgrep -if $1'
alias ='stty erase \^\?'
alias ='stty erase \^\H'
alias pat='pygmentize -g'
alias -g L=' |less'
alias -g V=' |vim -'
alias -g G=' |LC_ALL=C grep -i'
alias bt="bluetoothctl "

function log { $* |& while read out; do echo "$(date '+[%y/%m/%d %H:%M:%S]')" "$out"; done |& tee ;}
rmssh() { sed -i".bak" '/'$1'/d' ~/.ssh/known_hosts; }
up() { for i in $(eval echo {1..$1}); do cd ..; done; }
count_char() { char=$(echo "$1" |wc -c); echo $(($char-1)); }
pwgen() { PW=$(cat /dev/urandom |LC_ALL=C tr -dc 'a-zA-Z0-9' |head -c 26); echo "26 Chars: $PW"; }
