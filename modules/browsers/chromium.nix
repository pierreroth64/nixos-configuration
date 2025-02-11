{ pkgs, lib, config, ...}:
let
    cfg = config.my.browsers;
in
{
    options = {
        my.browsers.chromium.enable = lib.mkEnableOption "enable chromium browser";
    };
    
    config = lib.mkIf cfg.chromium.enable {
        environment = {
            systemPackages = with pkgs; [
                chromium
            ];
        };
        programs.chromium.enable = true;
    };
}