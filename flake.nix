{
  description = "My MacOS Nix Config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # nixos-23.11

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    pwnvim.url = "github:zmre/pwnvim";
  };
  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      darwin,
      pwnvim,
      ...
    }:
    {
      darwinConfigurations = {
        ESKMVL6YYF4621 = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          pkgs = import nixpkgs { system = "aarch64-darwin"; };
          modules = [
            ./modules/darwin
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit pwnvim;
                };
                users.matthewfurr.imports = [ ./modules/home-manager ];
              };
            }
          ];
        };
      };
    };
}
