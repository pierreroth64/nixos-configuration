{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./gimp.nix user)
    (import ./libreoffice.nix user)
  ];
}
