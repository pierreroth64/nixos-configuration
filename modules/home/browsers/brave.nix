{ userName, ... }:
{ pkgs, lib, config, ...}:
let
    cfg = config.my.${userName}.browsers;
in
{
    options = {
        my.${userName}.browsers.brave.enable = lib.mkEnableOption "enable brave browser for ${userName}";
    };
    
    config = lib.mkIf cfg.brave.enable {
        home-manager.users.${userName}.home.packages = with pkgs; [
            brave
        ];
    };
}