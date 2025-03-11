{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./steam.nix user)
    (import ./bottles.nix user)
  ];
}
