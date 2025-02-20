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
    my.${userName}.network.nmap.enable = lib.mkEnableOption "enable nmap for ${userName}";
  };

  config = lib.mkIf cfg.nmap.enable {
    home-manager.users.${userName}.home.packages = with pkgs; [
      nmap
    ];
  };
}
