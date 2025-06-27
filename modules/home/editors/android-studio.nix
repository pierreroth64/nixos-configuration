{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.editors;
in
{
  options = {
    my.${userName}.editors.android-studio.enable =
      lib.mkEnableOption "enable android-studio editor for ${userName}";
  };

  config = lib.mkIf cfg.android-studio.enable {

    home-manager.users.${userName}.home.packages = with pkgs; [
      android-studio
      android-tools
    ];
  };
}
