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
    my.${userName}.cli.git.enable = lib.mkEnableOption "enable git for ${userName}";
  };

  config = lib.mkIf cfg.git.enable {
    home-manager.users.${userName}.programs.git = {
      enable = true;
      inherit userName;
      inherit userEmail;
      signing = {
        signByDefault = true;
        key = "7E725B9260A593AF4906EACA4C19194F76882D47";
      };
      aliases = {
        co = "checkout";
        ci = "commit";
        ds = "diff --staged";
        st = "status -sb";
        unstage = "reset HEAD --";
        untrack = "rm --cached";
        ls = "log --graph --pretty=format:'%C(yellow)%h %C(blue)%ad %C(red)%d %C(reset)%s %C(green)[%an]' --decorate --date=short";
      };
      extraConfig = {
        pull = {
          rebase = "merges";
        };
      };
    };
  };
}
