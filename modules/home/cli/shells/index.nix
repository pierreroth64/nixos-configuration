{ userName, userCLIEditor, ... }@user:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  shellAliases = {
    cat = "bat";
    top = "btm";
    ".." = "cd ..";
    "..." = "cd ../..";
    man = "batman";
    grep = "batgrep";
  };
in
{
  imports = [
    (import ./bash.nix user)
    (import ./fish.nix user)
    (import ./zsh.nix user)
  ];

  config = {
    home-manager.users.${userName} = {
      home = {
        inherit shellAliases;
        sessionVariables = {
          EDITOR = userCLIEditor;
        };
      };
    };
  };
}
