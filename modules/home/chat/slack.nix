{ userName, ... }:
{ pkgs, lib, config, ...}:
let
    cfg = config.my.${userName}.chat;
in
{
    options = {
        my.${userName}.chat.slack.enable = lib.mkEnableOption "enable slack for ${userName}";
    };
    
    config = lib.mkIf cfg.slack.enable {
        home-manager.users.${userName}.home.packages = with pkgs; [
            slack
        ];
    };
}
