{ self, pkgs, ... }:

{
    programs.zellij = {
        enable = true;
        enableZshIntegration = true;
    };

    xdg.configFile."zellij/config.kdl".source = "${self}/.config/zellij/config.kdl";
}
