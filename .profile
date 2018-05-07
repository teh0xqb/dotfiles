uname -a

export EDITOR="vim"
export PYTHON=/usr/bin/python2
export rip=/code/ripcord
export port=8083
export PATH="/home/linuxbrew/.linuxbrew/bin:/code/scripts:$PATH"
export BOOT_JVM_OPTIONS="-client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"
export LEIN_SNAPSHOTS_IN_RELEASE="Y"
export N_PREFIX=~/n

[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.functions ] && . ~/.functions
[ -f ~/.environment ] && . ~/.environment
