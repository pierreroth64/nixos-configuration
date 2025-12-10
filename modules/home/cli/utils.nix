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
      command-not-found.enable = false;
      pay-respects.enable = true;
      yazi = {
        enable = true;
        enableBashIntegration = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        settings = {
          mgr = {
            show_hidden = true;
            show_symlink = true;
            sort_by = "natural";
            sort_dir_first = true;
            sort_sensitive = false;
            sort_reverse = false;
          };

          mgr.ratio = [
            1
            2
            3
          ];
        };

      };
      btop.enable = true;
      bottom.enable = true;
      ripgrep.enable = true;
      fzf.enable = true;
      eza = {
        enable = true;
        icons = "always";
        colors = "always";
      };
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
