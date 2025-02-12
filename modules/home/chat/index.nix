{ userName, ... }@user:
{ pkgs, lib, config, ...}:
{
    imports = [
        (import ./slack.nix user)
        (import ./whatsapp.nix user)
    ];
}