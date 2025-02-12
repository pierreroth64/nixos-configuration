{ userName, ... }@user:
{ pkgs, lib, config, ...}:
{
    imports = [
        (import ./browsers/index.nix user)
    ];
}