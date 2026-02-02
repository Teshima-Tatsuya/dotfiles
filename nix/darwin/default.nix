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
        extraSpecialArgs = { inherit self; };
        users.${username} = import ../home;
    };

}
