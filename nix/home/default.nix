{ self, pkgs, ... }:

{
    imports = [
        ./zsh.nix
    ];

    home.stateVersion = "24.05";

    home.packages = with pkgs; [
        awscli2
        oci-cli
        zellij
    ];

    xdg.configFile."ghostty/config".source = "${self}/.config/ghostty/config";
}
