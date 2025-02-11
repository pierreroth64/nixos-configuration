{ pkgs, lib, config, ...}:
let
    cfg = config.my.browsers;
in
{
    options = {
        my.browsers.brave.enable = lib.mkEnableOption "enable brave browser";
    };
    
    config = lib.mkIf cfg.brave.enable {
        environment = {
            systemPackages = with pkgs; [
                brave
            ];
        };
    };
}