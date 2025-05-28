{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./ffmpeg.nix user)
    (import ./spotify.nix user)
    (import ./vlc.nix user)
  ];
}
