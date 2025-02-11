{ config, pkgs, inputs, ... }:

{
  imports = [
    ../users/peio.nix
  ];

  # my toggles
  my.browsers.brave.enable = true;
  my.browsers.chromium.enable = true;
  my.browsers.firefox.enable = true;
  my.editors.vscode.enable = true;
  my.office.libreoffice.enable = true;
  my.chat.slack.enable = true;
  my.chat.whatsapp.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "adara";
}