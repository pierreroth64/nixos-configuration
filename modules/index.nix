{ pkgs, ... }:
{
    imports = [
        ./chat/index.nix
        ./programming.nix
        ./office/index.nix
        ./crypto.nix
        ./udev.nix
    ];
}