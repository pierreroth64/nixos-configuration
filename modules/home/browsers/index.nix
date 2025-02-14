{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./brave.nix user)
    (import ./chromium.nix user)
    (import ./firefox.nix user)
  ];
}
