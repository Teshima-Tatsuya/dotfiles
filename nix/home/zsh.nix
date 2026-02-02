{ pkgs, ... }:

{
    home.packages = with pkgs; [
        zsh
    ];

    programs.zsh = {
        enable = true;

        # History settings
        history = {
            path = "$HOME/.zsh_history";
            size = 10000;
            save = 10000;
            extended = true;
            ignoreDups = true;
            share = true;
        };

        # Completion
        enableCompletion = true;
        completionInit = ''
            autoload -U compinit; compinit
            zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
            zstyle ':completion:*:default' list-colors ''${(s.:.)LS_COLORS}
        '';

        # Aliases
        shellAliases = {
            la = "ls -la";
            ll = "ls -l";
            mux = "tmuxinator";
        } // (if pkgs.stdenv.isDarwin then {
            ls = "ls -G";
        } else {
            ls = "ls --color=auto";
        });

        # Environment variables
        sessionVariables = {
            EDITOR = "vim";
            XDG_CONFIG_HOME = "$HOME/.config";
            GOPATH = "$HOME/.go";
            LSCOLORS = "Exfxcxdxbxegedabagacad";
            LS_COLORS = "di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30";
            ZLS_COLORS = "$LS_COLORS";
            CLICOLOR = "true";
            DOCKER_HOST = "unix://\${HOME}/.colima/default/docker.sock";
        };

        # Additional PATH entries
        envExtra = ''
            export PATH="$GOPATH/bin:$PATH"
            export PATH="$HOME/.yarn/bin:$PATH"
            export PATH="$HOME/.cargo/bin:$PATH"
            export PATH="''${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
            export PATH="/opt/homebrew/opt/luajit-openresty/bin:$PATH"
        '';

        # Shell options and custom config
        initContent = ''
            # Options
            setopt auto_pushd
            setopt no_beep
            setopt auto_list
            setopt auto_menu
            setopt list_packed
            setopt list_types
            setopt bang_hist
            setopt hist_reduce_blanks

            # Prompt
            autoload -U colors; colors
            PROMPT="%{''${fg[green]}%}%n@%m%{''${reset_color}%} %~
%# "

            # peco-src function
            function peco-src () {
                local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
                if [ -n "$selected_dir" ]; then
                    BUFFER="cd ''${selected_dir}"
                    zle accept-line
                fi
                zle clear-screen
            }
            zle -N peco-src
            bindkey '^]' peco-src

            # iTerm2 integration
            test -e "''${HOME}/.iterm2_shell_integration.zsh" && source "''${HOME}/.iterm2_shell_integration.zsh"

            # Starship prompt
            eval "$(starship init zsh)"

            # mise
            eval "$(mise activate zsh)"

            # Kiro
            [[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
        '';
    };
}
