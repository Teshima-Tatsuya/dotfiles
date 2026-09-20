{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
        url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
        url = "github:LnL7/nix-darwin";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
  }:
    let
      username = 
        let
            sudoUser = builtins.getEnv "SUDO_USER";
            user = builtins.getEnv "USER";
        in
            if sudoUser!= "" then sudoUser
            else user;
    in 
  {
    darwinConfigurations = {
        "my-macbook" = nix-darwin.lib.darwinSystem {
            system = "aarch64-darwin";

            specialArgs = {
                # self: reference to flake source directory for accessing config files
                inherit self username nixpkgs;
            };

            modules = [
                ./nix/darwin
                home-manager.darwinModules.home-manager
            ];
        };
    };

    homeConfigurations = {
        # Standalone home-manager (no nix-darwin/NixOS) for the Claude Code
        # exec container: brings the same CLI toolset as my-macbook. Claude
        # Code itself is deliberately NOT managed here — it's installed via
        # its own native installer with built-in auto-update, since nixpkgs
        # can't keep pace with its release cadence.
        "claude-code" = home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs {
                system = "x86_64-linux";
                config.allowUnfreePredicate = pkg:
                    builtins.elem (nixpkgs.lib.getName pkg) [ "1password-cli" "terraform" ];
            };

            extraSpecialArgs = { inherit self username; };

            modules = [
                ./nix/home/claude-code.nix
            ];
        };
    };
  };
}
