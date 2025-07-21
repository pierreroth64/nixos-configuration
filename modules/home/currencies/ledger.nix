{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.currencies;
in
{
  options = {
    my.${userName}.currencies.ledger.enable = lib.mkEnableOption "enable ledger for ${userName}";
  };

  config = lib.mkIf cfg.ledger.enable {
    home-manager.users.${userName}.home.packages = with pkgs.unstable; [
      ledger-live-desktop
    ];
    hardware.ledger.enable = true;
  };
}
