{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./crypto.nix
    ./udev.nix
    ./starship.nix
    ./stylix.nix
  ];
}
