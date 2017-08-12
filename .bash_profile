if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# alias settings
alias ls='ls -G'
alias la='ls -laG'
alias mux='tmuxinator'

# alias vagrant
alias vu='vagrant up'
alias vs='vagrant suspend'
alias vssh='vagrant ssh'


export EDITOR="vim"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
