{ pkgs , ... }:

{
    system = {
        stateVersion = 5;

        primaryUser = "tatsuya";

        defaults = {
            controlcenter = {
                BatteryShowPercentage = true;
            };
        };
    };

    users.users.tatsuya = {
        home = "/Users/tatsuya";
        shell = pkgs.zsh;
    };

    nix.enable = false;

}
