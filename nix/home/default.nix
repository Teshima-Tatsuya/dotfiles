{ self, ... }:

{
    imports = [
        ./zsh.nix
    ];

    home.stateVersion = "24.05";

    xdg.configFile."ghostty/config".source = "${self}/.config/ghostty/config";
}
