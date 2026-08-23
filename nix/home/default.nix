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
        terraform  # first tool moved off mise, see .config/mise/config.toml
    ];

    xdg.configFile."ghostty/config".source = "${self}/.config/ghostty/config";
}
