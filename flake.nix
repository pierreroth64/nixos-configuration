{
  description = "peio's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    unstable-pkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix.url = "github:numtide/treefmt-nix";
    stylix.url = "github:danth/stylix/release-24.11";
  };

  outputs =
    {
      self,
      nixpkgs,
      treefmt-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      unstable = import inputs.unstable-pkgs {
        inherit system;
        config.allowUnfree = true;
      };
      treefmt-config = {
        projectRootFile = "flake.nix";
        programs = {
          nixfmt.enable = true;
          stylua.enable = true;
          yamlfmt.enable = true;
          mdformat.enable = true;
        };

        settings.global.excludes = [
          # unsupported extensions
          "*.{conf,ini}"
        ];
      };
    in
    {
      formatter.${system} = treefmt-nix.lib.mkWrapper pkgs treefmt-config;
      checks.${system} = {
        formatting = (treefmt-nix.lib.evalModule pkgs treefmt-config).config.build.check self;
      };

      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          { nixpkgs.overlays = [ (final: prev: { inherit unstable; }) ]; }
          ./hardware/scanned/hardware-framework13.nix
          ./hardware/index.nix
          ./hosts/adara.nix
          ./configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
            };
          }
        ];
      };
    };
}
