{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./ssh.nix user)
  ];

  options = {
    my.${userName}.eove.enable = lib.mkEnableOption "enable eove specific settings for ${userName}";
  };
}
