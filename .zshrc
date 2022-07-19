# cdコマンド発行時に自動的にpushdする
# cd -<TAB>で履歴を確認し、cd -<NUM>で移動できる。
setopt auto_pushd

# ビープ音をオフにする。
setopt no_beep

# complement
autoload -U compinit; compinit
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# histroy
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist
# 履歴にtimestampを含める
setopt extended_history
# 直前と同じコマンドをヒストリーに追加しない
setopt hist_ignore_dups
# 複数のプロンプトと履歴を共有する
setopt share_history
# 履歴追加時に余計な空白を除外する
setopt hist_reduce_blanks

# Look and Feel
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
PROMPT="%{${fg[green]}%}%n@%m%{${reset_color}%} %~
%# "

eval "$(anyenv init -)"
if [ -f "${HOME}/.common.conf" ] ; then
  source "${HOME}/.common.conf"
fi

if [ -f "${HOME}/.zsh_functions" ] ; then
  source "${HOME}/.zsh_functions"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/opt/homebrew/opt/luajit-openresty/bin:$PATH"
