{ config, pkgs, inputs, ... }:

{
  imports = [
    ../users/peio.nix
  ];

  # my toggles
  my.editors.vscode.enable = true;
  my.office.libreoffice.enable = true;
  my.chat.slack.enable = true;
  my.chat.whatsapp.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "adara";
}