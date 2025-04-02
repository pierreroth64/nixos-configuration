{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../users/vm-user.nix
  ];

  networking = {
    hostName = "adara";
    networkmanager.enable = true;
  };

  virtualisation.vmVariant = {
    # following configuration is added only when building VM with build-vm
    virtualisation = {
      memorySize = 8192;
      cores = 6;
      resolution = {
        x = 1280;
        y = 800;
      };
      qemu.options = [
        # Better display option
        "-vga virtio"
        "-display gtk,zoom-to-fit=false"
        # Enable copy/paste
        # https://www.kraxel.org/blog/2021/05/qemu-cut-paste/
        "-chardev qemu-vdagent,id=ch1,name=vdagent,clipboard=on"
        "-device virtio-serial-pci"
        "-device virtserialport,chardev=ch1,id=ch1,name=com.redhat.spice.0"
      ];
    };
  };
}
