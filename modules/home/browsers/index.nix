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

  options = {
    my.${userName}.browsers.default = lib.mkOption {
      type = lib.types.str;
      default = "firefox";
      description = "default browser for ${userName}";
    };
  };
}
