{ pkgs, ... }:
{
    imports = [
        ./git.nix
        ./crypto.nix
        ./udev.nix
    ];
}