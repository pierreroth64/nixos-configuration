{ pkgs, inputs, ...}:
{
    users.users.peio = {
        isNormalUser = true;
        description = "peio";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    # my toggles
    my.browsers.brave.enable = true;
    my.browsers.chromium.enable = true;
    my.browsers.firefox.enable = true;
    my.editors.vscode.enable = true;
    my.office.libreoffice.enable = true;

    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        users.peio = {
            home.username = "peio";
            home.homeDirectory = "/home/peio";
            home.stateVersion = "24.11";

            programs.git = {
                enable = true;
                userName = "peio";
                userEmail = "pierreroth64@gmail.com";
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