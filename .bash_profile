if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# alias settings
alias la='ls -la'

# alisa vagrant
alias vu='vagrant up'
alias vs='vagrant suspend'
alias vssh='vagrant ssh'


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
