export GPG_TTY=$(tty)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias vi=nvim
alias vim=nvim
alias nv=nvim

alias ctags="`brew --prefix`/bin/ctags"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/thot/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/thot/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/thot/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/thot/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

