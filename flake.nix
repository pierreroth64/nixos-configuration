{
  description = "my simple nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    unstable-pkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix.url = "github:numtide/treefmt-nix";
    stylix.url = "github:danth/stylix/release-25.11";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      mkOs = import ./helpers/mkOs.nix {
        inherit
          inputs
          lib
          pkgs
          unstable
          ;
      };
    in
    {
      formatter.${system} = treefmt-nix.lib.mkWrapper pkgs treefmt-config;
      checks.${system} = {
        formatting = (treefmt-nix.lib.evalModule pkgs treefmt-config).config.build.check self;
      };

      nixosConfigurations.default = mkOs {
        machine = "framework13";
        host = "adara";
      };

      nixosConfigurations.vm = mkOs {
        machine = "framework13";
        host = "adara-vm";
      };
    };
}
