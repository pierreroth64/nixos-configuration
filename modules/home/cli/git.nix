{
  userName,
  userEmail,
  userGPGPublicKey,
  ...
}:
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
      settings = {
        user = {
          email = userEmail;
          name = userName;
        };
        alias = {
          co = "checkout";
          ci = "commit";
          br = "branch";
          ds = "diff --staged";
          st = "status -sb";
          unstage = "reset HEAD --";
          untrack = "rm --cached";
          ls = "log --pretty=format:'%C(yellow)%h %C(blue)%ad %C(red)%d %C(reset)%s %C(green)[%an]' --decorate --date=short";
        };
        pull = {
          rebase = "merges";
        };
      };
      signing = {
        signByDefault = true;
        key = userGPGPublicKey;
      };
    };
  };
}
