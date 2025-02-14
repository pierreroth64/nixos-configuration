{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./crypto.nix
    ./udev.nix
    ./stylix.nix
  ];
}
