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

    # Register zsh in /etc/shells
    environment.shells = [ pkgs.zsh ];

    security.pam.services.sudo_local.touchIdAuth = true;

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
        "1password-cli"
        "terraform"  # BSL 1.1, nixpkgs marks it unfree
    ];

    nix.enable = false;

    environment.systemPackages = with pkgs; [
        nixpkgs.legacyPackages.aarch64-darwin.ghostty-bin
    ];

    homebrew = {
        enable = true;
        casks = [
            "1password"
            "notion"
            "obsidian"
            "visual-studio-code"
            "google-chrome"
            "claude"
            "drawio"
            "anki"
        ];
        onActivation = {
            cleanup = "none";
        };
    };

    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit self; };
        users.${username} = import ../home;
    };

}
