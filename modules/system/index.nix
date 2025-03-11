{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./dua.nix
    ./crypto.nix
    ./udev.nix
    ./starship.nix
    ./stylix.nix
    ./services/index.nix
  ];
}
