{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./spotify.nix user)
    (import ./vlc.nix user)
  ];
}
