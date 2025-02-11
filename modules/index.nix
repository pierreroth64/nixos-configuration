{ pkgs, ... }:
{
    imports = [
        ./browsers/index.nix
        ./chat/index.nix
        ./programming.nix
        ./editors/index.nix
        ./office/index.nix
    ];
}