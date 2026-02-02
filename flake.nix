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
  };
}
