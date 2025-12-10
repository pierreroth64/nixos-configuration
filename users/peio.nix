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
    userCLIEditor = "hx";
    userVisualEditor = "hx";
    userShell = "fish";
    userExtraGroups = [ ];
    userSSHIdentityFile = "id_ed25519";
    userSSHIdentityExtraFile = "id_rsa";
    userGPGPublicKey = "7E725B9260A593AF4906EACA4C19194F76882D47";
    userFeatureFlags = {
      currencies.ledger.enable = lib.mkForce true;
      eove.enable = lib.mkForce true;
      embedded.enable = lib.mkForce true;
      programming.enable = lib.mkForce true;
      browsers.chromium.enable = lib.mkForce true;
      network.anydesk.enable = lib.mkForce true;
      editors.vscode.enable = lib.mkForce true;
      editors.android-studio.enable = lib.mkForce true;
      editors.helix.enable = lib.mkForce true;
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
