{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix>
    ../users/vm-user.nix
  ];

  networking = {
    hostName = "adara-vm";
    networkmanager.enable = true;
  };

  virtualisation = {
    memorySize = 8192;
    cores = 6;
    resolution = {
      x = 1280;
      y = 800;
    };
  };
}
