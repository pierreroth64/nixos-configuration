{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.network;
in
{
  options = {
    my.${userName}.network.ftp.enable = lib.mkEnableOption "enable ftp for ${userName}";
  };

  config = lib.mkIf cfg.ftp.enable {
    home-manager.users.${userName}.home.packages = with pkgs; [
      ncftp
      filezilla
    ];
  };
}
