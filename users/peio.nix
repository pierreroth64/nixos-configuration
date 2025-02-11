{ pkgs, inputs, ...}:
{
    users.users.peio = {
        isNormalUser = true;
        description = "peio";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        users.peio = {
            home.username = "peio";
            home.homeDirectory = "/home/peio";
            home.stateVersion = "24.11";
        };
    };
}