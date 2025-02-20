{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./docker.nix user)
    (import ./git.nix user)
    (import ./utils.nix user)
    (import ./shells/index.nix user)
  ];
}
