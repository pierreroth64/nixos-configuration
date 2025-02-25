{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.gaming;
in
{
  options = {
    my.${userName}.gaming.steam.enable = lib.mkEnableOption "enable steam (gaming) for ${userName}";
  };

  config = lib.mkIf cfg.steam.enable {

    home-manager.users.${userName}.home = {
      packages = with pkgs; [
        steam
      ];
    };

    hardware = {
      graphics = {
        enable32Bit = true;
        extraPackages32 = [ pkgs.pkgsi686Linux.libva ];
      };
    };
  };
}
