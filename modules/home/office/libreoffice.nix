{ userName, ... }:
{ pkgs, lib, config, ...}:
let
    cfg = config.my.${userName}.office;
in
{
    options = {
        my.${userName}.office.libreoffice.enable = lib.mkEnableOption "enable libreoffice for ${userName}";
    };
    
    config = lib.mkIf cfg.libreoffice.enable {
        home-manager.users.${userName}.home.packages = with pkgs; [
            libreoffice
        ];
    };
}
