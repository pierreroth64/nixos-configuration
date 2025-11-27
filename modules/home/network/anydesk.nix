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
    my.${userName}.network.anydesk.enable = lib.mkEnableOption "enable anydesk for ${userName}";
  };

  config = lib.mkIf cfg.anydesk.enable {
    home-manager.users.${userName}.home.packages = with pkgs; [
      anydesk
    ];
  };
}
