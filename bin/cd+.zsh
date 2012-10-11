#TODO: add completion for d
_cd+() {
    false
}

add_to_path ()
{
    # only add to path if $1 doesn't exist
    if [[ "$PATH" =~ (^|:)"$1"(:|$) ]]
    then
        return 0
    fi
    export PATH=$1:$PATH
}

# if local, add to path
if [ -d ~/.cd+/ ]; then
    add_to_path $HOME/.cd+/bin
fi

function d {
    new_path="$(cd+ $@)"
    if [ -d "${new_path}" ]; then
        echo `pwd`
        cd ${new_path} && ls
    else
        echo "$@ not found :("
        false
    fi
}
