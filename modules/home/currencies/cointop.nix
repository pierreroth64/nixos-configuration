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
    my.${userName}.currencies.cointop.enable = lib.mkEnableOption "enable cointop for ${userName}";
  };

  config = lib.mkIf cfg.cointop.enable {
    home-manager.users.${userName}.home.packages = with pkgs.unstable; [
      cointop
    ];
  };
}
