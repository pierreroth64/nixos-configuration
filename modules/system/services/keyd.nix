{ pkgs, ... }:

{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        settings = {
          main = {
            leftalt = "leftctrl";
          };
        };
      };
    };
  };
}
