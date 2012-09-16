_cd+() {
    false
}

function d {
    new_path="$(cd+ $@)"
    if [ -d "${new_path}" ]; then
        echo `pwd`
        cd ${new_path} && ls
    else
        echo "dir not found :("
        false
    fi
}

complete -F _cd+ d
