{ pkgs, lib, config, ...}:
let
    cfg = config.my.chat;
in
{
    options = {
        my.chat.slack.enable = lib.mkEnableOption "enable slack";
    };
    
    config = lib.mkIf cfg.slack.enable {
        environment = {
            systemPackages = with pkgs; [
                slack
            ];
        };
    };
}