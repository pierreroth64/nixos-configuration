{
  pkgs,
  lib,
  inputs,
  unstable,
  ...
}:
let
  nixpkgs = inputs.nixpkgs;
in
{ machine, host }:
nixpkgs.lib.nixosSystem {
  specialArgs = { inherit inputs; };
  modules = [
    { nixpkgs.overlays = [ (final: prev: { inherit unstable; }) ]; }
    ../hardware/scanned/machines/${machine}.nix
    ../hardware/index.nix
    ../hosts/common.nix
    ../hosts/${host}.nix
    inputs.home-manager.nixosModules.default
    inputs.stylix.nixosModules.stylix
    inputs.sops-nix.nixosModules.sops
    {
      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
      };
    }
  ];
}
