{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.chat;
in
{
  options = {
    my.${userName}.chat.whatsapp.enable = lib.mkEnableOption "enable whatsapp for ${userName}";
  };

  config = lib.mkIf cfg.whatsapp.enable {
    home-manager.users.${userName}.home.packages = with pkgs; [
      whatsapp-for-linux
    ];
  };
}
