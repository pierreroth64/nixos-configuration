{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.unstable.linuxKernel.packages.linux_7_0;
}
