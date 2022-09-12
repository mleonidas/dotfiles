{
  description = "mleonidas home config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-22.05";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

    outputs = inputs@{ self, nixpkgs, nixpkgsUnstable, home-manager, ... }:
    {
      homeConfigurations = {
        mbp = inputs.home-manager.lib.homeManagerConfiguration {
          system = "aarch64-darwin";
          homeDirectory = "/Users/mleone";
          username = "mleone";
          stateVersion = "22.05";
          configuration = { config, pkgs, ... }:
            let
              overlay-unstable = final: prev: {
                unstable = inputs.nixpkgsUnstable.legacyPackages.aarch64-darwin;
              };
            in
            {
              nixpkgs.overlays = [ overlay-unstable ];
              nixpkgs.config = {
                allowUnfree = true;
                allowBroken = true;
              };

              imports = [
                ./nixpkgs/home-manager/home.nix
              ];
            };
        };
      };
          mbp = self.homeConfigurations.mbp.activationPackage;
          defaultPackage.aarch64-darwin = self.mbp;
    };

}
