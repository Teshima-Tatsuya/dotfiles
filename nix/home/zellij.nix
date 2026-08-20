{ self, pkgs, ... }:

{
    programs.zellij = {
        enable = true;
    };

    xdg.configFile."zellij/config.kdl".source = "${self}/.config/zellij/config.kdl";
}
