{ pkgs, lib, config, ...}:
let
    cfg = config.my.chat;
in
{
    options = {
        my.chat.whatsapp.enable = lib.mkEnableOption "enable whatsapp";
    };
    
    config = lib.mkIf cfg.whatsapp.enable {
        environment = {
            systemPackages = with pkgs; [
                whatsapp-for-linux
            ];
        };
    };
}