{ pkgs, ... }:

{
    programs.zellij = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            mouse_mode = false;
        };
    };
}
