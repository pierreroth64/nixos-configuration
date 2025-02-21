{ userName, userEmail, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:

{
  home-manager.users.${userName} = {
    programs = {
      thefuck.enable = true;
      kitty.enable = true;
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
}
