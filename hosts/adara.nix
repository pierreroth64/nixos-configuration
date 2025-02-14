{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../users/peio.nix
  ];

  networking = {
    hostName = "adara";
    networkmanager.enable = true;
  };
}
