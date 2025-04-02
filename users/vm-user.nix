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
    userPassword = "test";
    userEmail = "test@gmail.com";
    userCLIEditor = "vim";
    userShell = "fish";
    userExtraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
    ];
  };
  mkUser = import ../helpers/mkUser.nix {
    inherit
      pkgs
      inputs
      config
      lib
      ;
  };
in
mkUser { inherit myuser; }
