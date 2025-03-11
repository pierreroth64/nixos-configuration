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
    my.${userName}.gaming.bottles.enable = lib.mkEnableOption "enable bottles (gaming) for ${userName}";
  };

  config = lib.mkIf cfg.bottles.enable {

    home-manager.users.${userName}.home = {
      packages = with pkgs; [
        bottles
      ];
    };
  };
}
