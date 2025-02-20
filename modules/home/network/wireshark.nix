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
    my.${userName}.network.wireshark.enable = lib.mkEnableOption "enable wireshark for ${userName}";
  };

  config = lib.mkIf cfg.wireshark.enable {
    home-manager.users.${userName}.home.packages = with pkgs; [
      wireshark
    ];
  };
}
