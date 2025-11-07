{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      pciutils
      usbutils
      jq
      gparted
      file
    ];
  };
}
