{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./git.nix user)
    (import ./utils.nix user)
    (import ./shells/index.nix user)
  ];
}
