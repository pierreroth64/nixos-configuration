{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./android.nix user)
    (import ./i2c.nix user)
    (import ./minicom.nix user)
  ];

  options = {
    my.${userName}.embedded.enable = lib.mkEnableOption "enable embedded packages for ${userName}";
  };
}
