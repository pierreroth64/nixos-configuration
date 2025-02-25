{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      git
      gitFull
      gitui
      git-subrepo
      git-extras
    ];
  };
}
