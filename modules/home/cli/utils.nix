{ userName, userEmail,... }:
{ pkgs, lib, config, ...}:
let
    cfg = config.my.${userName}.cli;
in
{
    options = {
        my.${userName}.cli.utils.enable = lib.mkEnableOption "enable CLI utils for ${userName}";
    };
    
    config = lib.mkIf cfg.utils.enable {
        home-manager.users.${userName}.programs = {
            yazi.enable = true;
            btop.enable = true;
            ripgrep.enable = true;
            bat = {
                enable = true;
                extraPackages = with pkgs.bat-extras; [ batman batgrep ];
            };
        };
    };
}
