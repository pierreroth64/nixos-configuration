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
      currencies = {
        ledger.enable = lib.mkForce true;
      };
      eove.enable = lib.mkForce true;
    };
    # TODO: this line does not work as it exports the ciphered value of the token
    # on the command line, use:
    # export GITHUB_TOKEN=$(sops -d secrets/secrets.json | jq -r .users.peio.github.token)
    userGithubToken = config.sops.placeholder."users/${userName}/github/token";
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
