{ pkgs, lib, config, ...}:
let
    cfg = config.my.browsers;
in
{
    options = {
        my.browsers.firefox.enable = lib.mkEnableOption "enable firefox browser";
    };
    
    config = lib.mkIf cfg.firefox.enable {
        programs = {
            firefox = {
                enable = true;
                policies = {
                    DisableTelemetry = true;
                    DisableFirefoxStudies = true;
                    DisablePocket = true;
                    DisableFirefoxAccounts = true;
                    DisableAccounts = true;
                };
            };
        };
    };
}