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
    my.${userName}.media.ffmpeg.enable = lib.mkEnableOption "enable ffmpeg for ${userName}";
  };

  config = lib.mkIf cfg.ffmpeg.enable {
    home-manager.users.${userName}.home.packages = with pkgs.unstable; [
      ffmpeg
    ];
  };
}
