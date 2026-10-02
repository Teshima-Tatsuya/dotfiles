{ pkgs, ... }:

{
    imports = [
        ./zsh.nix
        ./zellij.nix
        ./nvim.nix
        ./ghostty.nix
        ./claude.nix
        ./git.nix
        ./ruby.nix
    ];

    home.stateVersion = "24.05";

    programs.awscli.enable = true;

    home.packages = with pkgs; [
        oci-cli
        _1password-cli
        terraform
        ripgrep
        uv
        rustc
        cargo
        nodejs_24
        gh  # moved off brew
        ghq  # moved off brew
        peco  # moved off brew
        go  # moved off brew
        jq  # moved off brew
        cloudflared
    ];
}
