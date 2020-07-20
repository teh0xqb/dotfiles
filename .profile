uname -a

export EDITOR="vim"

# export BOOT_JVM_OPTIONS="-client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"

# export LEIN_SNAPSHOTS_IN_RELEASE="Y"

export N_PREFIX=~/n
export PATH=~/bin:$PATH

[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.functions ] && . ~/.functions
[ -f ~/.environment ] && . ~/.environment
