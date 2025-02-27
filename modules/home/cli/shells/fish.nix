{ userName, userCLIEditor, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.cli.shells;
in
{
  options = {
    my.${userName}.cli.shells.fish.enable = lib.mkEnableOption "enable fish for ${userName}";
  };

  config = lib.mkIf cfg.fish.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        starship init fish | source
        direnv hook fish | source
        zoxide init fish | source
      '';
    };

    home-manager.users.${userName} = {
      programs = {
        fish = {
          enable = true;
          shellAbbrs = {
            ls = "eza";
            ll = "eza -l";
            lla = "eza -la";
            tree = "eza --tree";
          };

        };
      };
    };
  };
}
