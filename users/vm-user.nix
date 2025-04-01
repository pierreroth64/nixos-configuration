{
  pkgs,
  inputs,
  config,
  lib,
  ...
}@args:
let
  myuser = {
    userName = "test";
    userEmail = "pierreroth64@gmail.com";
    userCLIEditor = "vim";
    userShell = "fish";
    userPassword = "test";
    userExtraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
    ];
  };
  mkUser = import ./helpers/mkUser.nix {
    inherit
      pkgs
      inputs
      config
      lib
      ;
  };
in
mkUser { inherit myuser; }
