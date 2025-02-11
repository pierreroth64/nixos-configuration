{ pkgs, ... }:
{
    imports = [
        ./browsers/index.nix
        ./programming.nix
        ./editors/index.nix
        ./office/index.nix
    ];
}