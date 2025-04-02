{ pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./git.nix
    ./dua.nix
    ./crypto.nix
    ./udev.nix
    ./starship.nix
    ./stylix.nix
    ./services/index.nix
    ./zip.nix
  ];
}
