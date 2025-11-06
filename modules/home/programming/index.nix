{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./rust.nix user)
  ];

  options = {
    my.${userName}.programming.enable =
      lib.mkEnableOption "enable programming packages for ${userName}";
  };
}
