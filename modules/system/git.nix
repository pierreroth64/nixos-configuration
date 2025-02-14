{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      git
      gitFull
      git-subrepo
      git-extras
    ];
  };
}
