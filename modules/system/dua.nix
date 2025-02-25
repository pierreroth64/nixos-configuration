{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      dua
    ];
  };
}
