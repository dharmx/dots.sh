[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

while read -r file
do 
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
theme
env
alias
utils
opts
plugs
keys
prompt
EOF

greet="xbl"
greet_path="$HOME/.bin/misc/$greet"
[ -f "$greet_path" ] && eval "$greet_path" || _default_greeter
unset greet_path greet

# vim:ft=zsh:nowrap