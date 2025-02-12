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

    my.peio.browsers.brave.enable = true;
    my.peio.browsers.firefox.enable = true;

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