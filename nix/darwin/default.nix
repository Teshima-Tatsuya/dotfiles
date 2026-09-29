{ pkgs, self, username, nixpkgs, dotfilesDir, ... }:

{
    system = {
        stateVersion = 5;

        primaryUser = username;

        defaults = {
            controlcenter = {
                BatteryShowPercentage = true;
            };

            # Tap to click
            trackpad = {
                Clicking = true;
            };
            NSGlobalDomain = {
                "com.apple.mouse.tapBehavior" = 1;

                # Key repeat instead of the accent popup on long press
                ApplePressAndHoldEnabled = false;
                KeyRepeat = 2;
                InitialKeyRepeat = 15;

                # Disable auto-correction / substitutions
                NSAutomaticSpellingCorrectionEnabled = false;
                NSAutomaticCapitalizationEnabled = false;
                NSAutomaticQuoteSubstitutionEnabled = false;
                NSAutomaticDashSubstitutionEnabled = false;
                NSAutomaticPeriodSubstitutionEnabled = false;

                AppleShowAllExtensions = true;

                # Save dialogs: local by default, expanded
                NSDocumentSaveNewDocumentsToCloud = false;
                NSNavPanelExpandedStateForSaveMode = true;
                NSNavPanelExpandedStateForSaveMode2 = true;
            };

            finder = {
                AppleShowAllExtensions = true;
                ShowPathbar = true;
                ShowStatusBar = true;
                FXPreferredViewStyle = "Nlsv";      # list view
                FXDefaultSearchScope = "SCcf";      # search the current folder
                FXEnableExtensionChangeWarning = false;
                _FXSortFoldersFirst = true;
            };

            CustomUserPreferences = {
                # Japanese IME: disable live conversion
                "com.apple.inputmethod.Kotoeri" = {
                    JIMPrefLiveConversionKey = false;
                };
                # Don't create .DS_Store on network / USB volumes
                "com.apple.desktopservices" = {
                    DSDontWriteNetworkStores = true;
                    DSDontWriteUSBStores = true;
                };
                # Disable Apple personalized ads
                "com.apple.AdLib" = {
                    allowApplePersonalizedAdvertising = false;
                };
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

    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
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
        extraSpecialArgs = { inherit self dotfilesDir; };
        users.${username} = import ../home;
    };

}
