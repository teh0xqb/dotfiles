uname -a

export EDITOR="vim"
export port=8083
export PATH="/usr/local/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/dotfiles/scripts/butler/:$PATH"
export BOOT_JVM_OPTIONS="-client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"
export LEIN_SNAPSHOTS_IN_RELEASE="Y"
export N_PREFIX=~/n
export PATH=~/bin:$PATH
export PATH=/usr/local/opt/thrift@0.9/bin:$PATH

[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.functions ] && . ~/.functions
[ -f ~/.environment ] && . ~/.environment
