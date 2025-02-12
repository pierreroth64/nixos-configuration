{ pkgs, ... }:
{
    imports = [
        ./chat/index.nix
        ./programming.nix
        ./crypto.nix
        ./udev.nix
    ];
}