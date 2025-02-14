{ userName, ... }@user:
{ pkgs, lib, config, ...}:
let
    shellAliases = let newls = "eza --git --header --icons"; in {
        cat = "bat";
        top = "btop";
        ".." = "cd ..";
        "..." = "cd ../..";
        ls = "${newls}";
        ll = "${newls} -l";
        la = "${newls} -a";
        lla = "${newls} -la";
        man = "batman";
        grep = "batgrep";
    };
in
{
    imports = [
        (import ./bash.nix user)
        (import ./zsh.nix user)
    ];

    config = {
        home-manager.users.${userName}.programs = {
            bash.shellAliases = shellAliases;
            zsh.shellAliases = shellAliases; 
        };
    };
}
