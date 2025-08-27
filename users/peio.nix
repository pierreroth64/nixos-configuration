{
  pkgs,
  inputs,
  config,
  lib,
  ...
}@args:
let
  myuser = rec {
    userName = "peio";
    userPassword = "";
    userEmail = "pierreroth64@gmail.com";
    userCLIEditor = "vim";
    userShell = "fish";
    userExtraGroups = [ ];
    userSSHIdentityFile = "~/.ssh/id_ed25519";
    userSSHIdentitySecondaryFile = "~/.ssh/id_rsa";
    userGPGPublicKey = "7E725B9260A593AF4906EACA4C19194F76882D47";
    userFeatureFlags = {
      currencies.ledger.enable = lib.mkForce true;
      eove.enable = lib.mkForce true;
      browsers.chromium.enable = lib.mkForce true;
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
