# Source autojump on BASH or ZSH depending on the shell
if [ "$BASH_VERSION" ] && [ -n "$PS1" ] && echo $SHELLOPTS | grep -v posix >>/dev/null; then
    if [ -f ~/.cd+/bin/cd+.bash ]; then
        source ~/.cd+/bin/cd+.bash
    fi
elif [ "$ZSH_VERSION" ] && [ -n "$PS1" ]; then
    #TODO: add zsh version
    source ~/.cd+/bin/cd+.zsh
fi
