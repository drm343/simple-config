source $HOME/.config/simple-config/init.sh

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
