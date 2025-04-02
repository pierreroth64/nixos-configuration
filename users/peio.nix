{
  pkgs,
  inputs,
  config,
  lib,
  ...
}@args:
let
  myuser = {
    userName = "peio";
    userPassword = "";
    userEmail = "pierreroth64@gmail.com";
    userCLIEditor = "vim";
    userShell = "fish";
    userExtraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
    ];
    userSSHIdentityFile = "~/.ssh/id_ed25519";
    userSSHIdentitySecondaryFile = "~/.ssh/id_rsa";
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
