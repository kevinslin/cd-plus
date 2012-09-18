_cd+() {
    false
}

add_to_path ()
{
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

complete -F _cd+ d
