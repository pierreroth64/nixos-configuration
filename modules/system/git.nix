{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      git
      gitFull
      gitui
      lazygit
      git-subrepo
      git-extras
      gource
    ];
  };
}
