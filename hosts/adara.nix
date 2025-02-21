{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../users/all.nix # you can import all users or select some of them
  ];

  networking = {
    hostName = "adara";
    networkmanager.enable = true;
  };
}
