{ pkgs, self, username, nixpkgs, ... }:

{
    system = {
        stateVersion = 5;

        primaryUser = username;

        defaults = {
            controlcenter = {
                BatteryShowPercentage = true;
            };
        };
    };

    users.users.${username} = {
        home = "/Users/${username}";
        shell = pkgs.zsh;
    };

    nix.enable = false;

    environment.systemPackages = with pkgs; [
        tmux
        nixpkgs.legacyPackages.aarch64-darwin.ghostty-bin
    ];

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${username} = { ... }: {
            home.stateVersion = "24.05";

            xdg.configFile."ghostty/config".source = "${self}/.config/ghostty/config";
        };
    };

}
