{ pkgs, ... }: 
{
    imports = [
        ./brave.nix
        ./chromium.nix
    ];
}