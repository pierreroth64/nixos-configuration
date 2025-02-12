{ userName, ... }@user:
{ pkgs, lib, config, ...}:
{
    imports = [
        (import ./libreoffice.nix user)
    ];
}