{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  home = config.users.users.${userName}.home;
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
        set -x GITHUB_TOKEN (cat ${home}/.github_token)
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
