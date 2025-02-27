{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./cointop.nix user)
    (import ./ledger.nix user)
  ];
}
