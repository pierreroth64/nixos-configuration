{ userName, userEmail, ... }:
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
    my.${userName}.cli.utils.enable = lib.mkEnableOption "enable CLI utils for ${userName}";
  };

  config = lib.mkIf cfg.utils.enable {
    home-manager.users.${userName} = {
      programs = {
        kitty = {
          enable = true;
          font = {
            name = "FiraCode Nerd Font Mono";
            size = 10.0;
          };
        };
        yazi.enable = true;
        btop.enable = true;
        ripgrep.enable = true;
        fzf.enable = true;
        eza.enable = true;
        zoxide = {
          enable = true;
          options = [ "--cmd cd" ];
        };
        direnv = {
          enable = true;
          nix-direnv = {
            enable = true;
          };
        };
        bat = {
          enable = true;
          extraPackages = with pkgs.bat-extras; [
            batman
            batgrep
          ];
        };
      };
    };
  };
}
