{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./i2c.nix user)
  ];

  options = {
    my.${userName}.embedded.enable = lib.mkEnableOption "enable embedded packages for ${userName}";
  };
}
