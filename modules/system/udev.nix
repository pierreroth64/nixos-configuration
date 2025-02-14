{ config, pkgs, ... }:
{
  services = {
    udev = {
      extraRules = ''
        SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="plugdev"
        SUBSYSTEM=="usb", ATTR{idVendor}=="0483", MODE="0666", GROUP="plugdev"
      '';
    };
  };
}
