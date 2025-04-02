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
    userExtraGroups = [ ];
    userSSHIdentityFile = "";
    userSSHIdentitySecondaryFile = "";
    userGPGPublicKey = "";
    userFeatureFlags = {
      eove.enable = lib.mkForce false;
    };
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
