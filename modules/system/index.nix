{ pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./cli.nix
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
