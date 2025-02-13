{ userName, ... }@user:
{ pkgs, lib, config, ...}:
{
    imports = [
        (import ./browsers/index.nix user)
        (import ./chat/index.nix user)
        (import ./cli/index.nix user)
        (import ./currencies/index.nix user)
        (import ./editors/index.nix user)
        (import ./office/index.nix user)
    ];
}
