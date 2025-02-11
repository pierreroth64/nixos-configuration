{ pkgs, ... }: 
{
    imports = [
        ./slack.nix
        ./whatsapp.nix
    ];
}