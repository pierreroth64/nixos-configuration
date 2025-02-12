{ pkgs, ... }:
{
    imports = [
        ./programming.nix
        ./crypto.nix
        ./udev.nix
    ];
}