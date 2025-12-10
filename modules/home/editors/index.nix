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
    (import ./helix.nix user)
    (import ./vscode.nix user)
  ];
}
