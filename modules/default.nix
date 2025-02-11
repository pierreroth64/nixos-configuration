{ pkgs, ... }:
{
    imports = [
        ./browsers.nix
        ./programming.nix
        ./editors.nix
    ];
}