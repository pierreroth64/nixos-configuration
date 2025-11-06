{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.programming;
in
{

  config = lib.mkIf cfg.enable {
    home-manager.users.${userName}.home.packages = with pkgs; [
      rustc
      cargo
    ];
  };
}
