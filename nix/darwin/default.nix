{ pkgs , username, ... }:

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

}
