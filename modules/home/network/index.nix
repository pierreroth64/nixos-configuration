{ userName, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    (import ./anydesk.nix user)
    (import ./nmap.nix user)
    (import ./wireshark.nix user)
    (import ./ftp.nix user)
  ];
}
