{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.office;
in
{
  options = {
    my.${userName}.office.gimp.enable = lib.mkEnableOption "enable gimp for ${userName}";
  };

  config = lib.mkIf cfg.gimp.enable {
    home-manager.users.${userName}.home.packages = with pkgs.unstable; [
      gimp
    ];
  };
}
