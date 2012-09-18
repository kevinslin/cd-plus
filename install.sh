#!/usr/bin/env bash

export cdPlusDir=`pwd`


# This loads cd+ into the shell session.
exec_string="[ -s \"$HOME/.cd+/bin/cd+.sh\" ] && source \"$HOME/.cd+/bin/cd+.sh\""


# Add line to bashrc and zshrc if not already present.
for rc in bashrc zshrc; do
    if [ -s "$HOME/.$rc" ] && ! grep -q "$exec_string" "$HOME/.$rc"; then
        printf "\n$exec_string\n" >> "$HOME/.$rc"
        printf "== Added cd+ to '~/.$rc'\n"
    fi
done

# Default Install Directory
if [[ ${UID} -eq 0 ]]; then
    local=
    prefix=/usr
else
    local=true
    prefix=~/.cd+
fi

# INSTALLATION
if [ "$cdPlusDir" != "$HOME/.cd+" ]; then
  ln -fs "$cdPlusDir" "$HOME/.cd+"
fi

echo "=== source ~/.bashrc or ~/.zshrc to load cd+"
