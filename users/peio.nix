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
    my.peio.cli.git.enable = true;
    #my.peio.browsers.brave.enable = true;
    #my.peio.browsers.chromium.enable = true;
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
        };
    };
}
