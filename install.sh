export cdPlusDir=`pwd`
echo $cdPlusDir

# Symlink to ~/.cd+ if installing from another path
if [ "$cdPlusDir" != "$HOME/.cd+" ]; then
  ln -fs "$cdPlusDir" "$HOME/.cd+"
fi

# This loads cd+ into the shell session.
exec_string="[ -s \"$HOME/.cd+/bin/cd+.sh\" ] && source \"$HOME/.cd+/bin/cd+.sh\""

# Add line to bashrc and zshrc if not already present.
for rc in bashrc zshrc; do
    if [ -s "$HOME/.$rc" ] && ! grep -q "$exec_string" "$HOME/.$rc"; then
        printf "\n$exec_string\n" >> "$HOME/.$rc"
        printf "== Added cd+ to '~/.$rc'\n"
    fi
done

echo "=== source ~/.bashrc or ~/.zshrc to load cd+"
