{ userName, ... }@user:
{ pkgs, lib, config, ...}:
{
    imports = [
        (import ./ledger.nix user)
    ];
}