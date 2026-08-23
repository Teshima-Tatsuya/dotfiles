{ self, pkgs, ... }:

{
    imports = [
        ./zsh.nix
        ./zellij.nix
    ];

    home.stateVersion = "24.05";

    programs.awscli.enable = true;

    home.packages = with pkgs; [
        oci-cli
        _1password-cli
        terraform
        lua-language-server
        ripgrep
        uv
        rustc
        cargo
        rust-analyzer
        nodejs_24
        gh  # moved off brew
        ghq  # moved off brew
        git-secrets  # moved off brew
        neovim  # moved off brew
        peco  # moved off brew
        go  # moved off brew
        jq  # moved off brew
        typescript-language-server
        bash-language-server
    ];

    xdg.configFile."ghostty/config".source = "${self}/.config/ghostty/config";
}
