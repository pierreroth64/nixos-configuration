{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.media;
in
{
  options = {
    my.${userName}.media.vlc.enable = lib.mkEnableOption "enable vlc for ${userName}";
  };

  config = lib.mkIf cfg.vlc.enable {
    home-manager.users.${userName}.home.packages = with pkgs.unstable; [
      vlc
    ];
  };
}
