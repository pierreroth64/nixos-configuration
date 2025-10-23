{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.embedded;
in
{

  config = lib.mkIf cfg.enable {
    home-manager.users.${userName}.home.packages = with pkgs; [
      probe-rs
    ];
  };
}
