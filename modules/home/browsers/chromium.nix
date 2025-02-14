{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.browsers;
in
{
  options = {
    my.${userName}.browsers.chromium.enable =
      lib.mkEnableOption "enable chromium browser for ${userName}";
  };

  config = lib.mkIf cfg.chromium.enable {
    home-manager.users.${userName}.home.packages = with pkgs; [
      chromium
    ];

    programs.chromium.enable = true;
  };
}
