{ pkgs, ... }:
{
  imports = [
    ./services/index.nix
    ./bash.nix
    ./cli.nix
    ./git.nix
    ./dua.nix
    ./crypto.nix
    ./starship.nix
    ./stylix.nix
    ./udev.nix
    ./utils.nix
    ./zip.nix
  ];
}
