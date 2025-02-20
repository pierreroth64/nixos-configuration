{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./nmap.nix user)
    (import ./wireshark.nix user)
  ];
}
