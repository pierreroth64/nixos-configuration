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
    };
  };
}
