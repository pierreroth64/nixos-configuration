{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.cli;
in
{
  options = {
    my.${userName}.cli.docker.enable = lib.mkEnableOption "enable docker for ${userName}";
  };

  config = lib.mkIf cfg.docker.enable {
    virtualisation = {
      docker = {
        enable = true;
      };
    };
    users.users.${userName} = {
      extraGroups = [
        "docker"
      ];
    };
    home-manager.users.${userName}.home.packages = with pkgs; [
      docker
      docker-compose
    ];
  };
}
