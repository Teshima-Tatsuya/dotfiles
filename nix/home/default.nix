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
        terraform  # moved off mise
        lua-language-server  # moved off mise
        ripgrep  # moved off mise
        uv  # moved off mise
        rustc  # moved off mise
        cargo  # moved off mise
        rust-analyzer  # moved off mise
        nodejs_24  # moved off mise
        gh  # moved off brew
        ghq  # moved off brew
        git-secrets  # moved off brew
        neovim  # moved off brew
        peco  # moved off brew
        starship  # moved off brew
        go  # moved off brew
        jq  # moved off brew
    ];

    xdg.configFile."ghostty/config".source = "${self}/.config/ghostty/config";
}
