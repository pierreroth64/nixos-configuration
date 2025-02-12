{ pkgs, inputs, ...}@args:
let
    myuser = {
        userName = "peio";
        userEmail = "pierreroth64@gmail.com";
    };
in
{
    users.users.peio = {
        isNormalUser = true;
        description = "peio";
        extraGroups = [ "networkmanager" "wheel" "docker" "dialout" ];
    };

    # you just have to toggle this flags to enable/disable a module for this user
    my.peio.browsers.brave.enable = true;
    my.peio.browsers.firefox.enable = true;
    my.peio.editors.vscode.enable = true;
    my.peio.office.libreoffice.enable = true;
    my.peio.chat.whatsapp.enable = true;
    my.peio.chat.slack.enable = true;
    my.peio.currencies.ledger.enable = true;

    imports = [
       (import ../modules/home/index.nix myuser)
    ];

    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        users."${myuser.userName}" = {
            home.username = myuser.userName;
            home.homeDirectory = "/home/${myuser.userName}";
            home.stateVersion = "24.11";

            programs.git = {
                enable = true;
                userName = myuser.userName;
                userEmail = myuser.userEmail;
                aliases = {
                    co = "checkout";
                    ci = "commit";
                    ds = "diff --staged";
                    st = "status -sb";
                    unstage = "reset HEAD --";
                    untrack = "rm --cached";
                    ls = "log --graph --pretty=format:'%C(yellow)%h %C(blue)%ad %C(red)%d %C(reset)%s %C(green)[%an]' --decorate --date=short";
                };
            };
        };
    };
}
