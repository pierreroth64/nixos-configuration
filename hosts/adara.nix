{ config, pkgs, inputs, ... }:

{
  imports = [
    ../users/peio.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "adara";
}