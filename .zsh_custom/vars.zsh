function decrypt_file() {
    CRYPT_FILE=$1
    echo -n "Enter passphrase: "
    stty -echo 
    gpg --passphrase-fd 0 --pinentry-mode loopback --decrypt "$CRYPT_FILE" |tar zxv
    stty echo
}
# Error log function
err() {
  if [[ $? != '0' ]]; then
      echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
  else
     
      echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&1
  fi
}
#Find files and redirect output to dev/null
function f() {sudo find / -type f -iname "$1" 2>/dev/null ;}
#Find folders and redirect output to dev/null
function fd() { sudo find / -type d -iname "*$1*" 2>/dev/null ;}
function log { $* |& while read out; do echo "$(date '+[%y/%m/%d %H:%M:%S]')" "$out"; done |& tee ;}
function rmssh() { sed -i".bak" '/'$1'/d' ~/.ssh/known_hosts; }
function up() { for i in $(eval echo {1..$1}); do cd ..; done; }
function count_char() { char=$(echo "$1" |wc -c); echo $(($char-1)); }
function pwgen() { PW=$(cat /dev/urandom |LC_ALL=C tr -dc 'a-zA-Z0-9' |head -c 26); echo "26 Chars: $PW"; }
# Limit CPU for a process to %
function limit_pid() { 
    PID=$1; PERCENTAGE=$2
    cpu-limit() { cpulimit -p "$PID" -l"$PERCENTAGE" 2>&1 >/dev/null &; } 
    if [[ -z "$PERCENTAGE" ]]; then 
        echo "Usage is cpu-limit PID PERCENTAGE: i.e cpu-limit 114212 80" 
    else 
        cpulimit -z -p"$PID" -l"$PERCENTAGE"
    fi
}

# Lists all pods that have been restarted within less than 10 minutes and sorts the list
# kube_restarted takes no argument
kube_restarted () {
    kgp -owide --all-namespaces -owide --sort-by=.metadata.creationTimestamp | \
    grep -E ' [0-6]{1}[0-9]{1,2}m' | \
    cut -d' ' -f1 |sort -u #|uniq
}
# List all pods that have restarted within 9 hours and sorts on uptime
# kube_restarted takes no argument
kube_restarted () {
    kgp -owide --all-namespaces -owide --sort-by=.metadata.creationTimestamp | \
    grep -E ' ([0-9]{1}[0-9]{1,2}(m|s))|NAMESPACE.*NAME' | \
    tr -s ' '  |cut -d ' ' -f1,2,6,8 |sort -u |column -t
}
# Searches all pods in a namespace for specified pattern
# kube_getlogs <SSN-Number-Here>
# Can also search for multiple patterns with:
# kube_getlogs "<SSN-Number-Here>|<Job-Id-Number>|<foo bar>"
# Use "za" to open or close a folded section
kube_getlogs(){
    pattern="$1"
    pods=$(kgp -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{end}{"\n\n\n"}')
    echo "This will take a little while..."
    echo "Probably around 30 sec to 2 minutes depending on the amount of logs availabe"
    for podname ($=pods); do
        if [[ ! "$podname" =~ audit ]]; then
             echo "####START $podname ####"
             kubectl logs "$podname" --all-containers=TRUE |grep -iE "$pattern" 2>&1 \
             |while read logline; do echo "$podname: $logline"; done
             echo "####END####"
         fi
    done |vim -  -c 'execute "normal ggO#### Unfold or fold the sections with '"'za'"' ####"' -c 'execute "normal ggO###############################################"' -c 'execute "normal ggjo###############################################\n"' -c 'execute ":setl foldmethod=marker foldmarker=####START,####END"'
}

# Get all types of error (error,warning,crit,fatal) logs from current-context, and send it to vim, neatly folding up each section.
# Use "za" to open or close a folded section
kube_geterrlogs(){
    #ns=$1
    #pods=$(kubectl -n$ns get pods -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{end}{"\n\n\n"}')
    pods=$(kgp -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{end}{"\n\n\n"}')
    echo "This will take a little while..."
    echo "Probably around 30 sec to 2 minutes depending on the amount of logs availabe"
    for podname ($=pods); do
        if [[ ! "$podname" =~ audit ]]; then
        echo "####START $podname ####"
        kubectl logs $podname --all-containers=TRUE |grep -iE 'error|warning|crit|fatal' 2>&1 \
        |while read logline; do echo "$podname: $logline"; done
        echo "####END####"
        fi
    done | vim -  -c 'execute "normal ggO#### Unfold or fold the sections with '"'za'"' ####"' -c 'execute "normal ggO###############################################"' -c 'execute "normal ggjo###############################################\n"' -c 'execute ":setl foldmethod=marker foldmarker=####START,####END"'
}


