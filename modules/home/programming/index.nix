{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./build.nix user)
    (import ./rust.nix user)
  ];

  options = {
    my.${userName}.programming.enable =
      lib.mkEnableOption "enable programming packages for ${userName}";
  };
}
