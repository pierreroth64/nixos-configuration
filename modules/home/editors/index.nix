{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./android-studio.nix user)
    (import ./vscode.nix user)
  ];
}
