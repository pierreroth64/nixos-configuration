{ pkgs, lib, config, ...}:
let
    cfg = config.my.office;
in
{
    options = {
        my.office.libreoffice.enable = lib.mkEnableOption "enable libre office suite";
    };
    
    config = lib.mkIf cfg.libreoffice.enable {
        environment = {
            systemPackages = with pkgs; [
                libreoffice
            ];
        };
    };
}