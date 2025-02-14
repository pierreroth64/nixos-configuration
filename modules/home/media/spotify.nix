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
    my.${userName}.media.spotify.enable = lib.mkEnableOption "enable spotify for ${userName}";
  };

  config = lib.mkIf cfg.spotify.enable {
    home-manager.users.${userName}.home.packages = with pkgs; [
      spotify
    ];
  };
}
