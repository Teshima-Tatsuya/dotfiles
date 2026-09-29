{ self, ... }:

{
    xdg.configFile."ghostty/config".source = "${self}/.config/ghostty/config";
}
