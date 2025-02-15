{ pkgs, ... }:
{
  imports = [
    ./bootloader.nix
    ./i2c.nix
  ];
}
