{ userName, ... }@user:
{ pkgs, lib, config, ...}:
{
    imports = [
        (import ./git.nix user)
    ];
}