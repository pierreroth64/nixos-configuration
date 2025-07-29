{
  userName,
  userCLIEditor,
  ...
}@user:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  shellAliases = {
    top = "btm";
    ".." = "cd ..";
    "..." = "cd ../..";
    man = "batman";
    grep = "batgrep";
  };
in
{
  imports = [
    (import ./fish.nix user)
    (import ./zsh.nix user)
  ];

  config = {
    home-manager.users.${userName} = {
      home = {
        inherit shellAliases;
      };
    };
  };
}
