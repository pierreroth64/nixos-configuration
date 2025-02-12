{ userName, ... }:
{ pkgs, lib, config, ...}:
let
    cfg = config.my.${userName}.browsers;
in
{
    options = {
        my.${userName}.browsers.firefox.enable = lib.mkEnableOption "enable firefox browser for ${userName}";
    };
    
    config = lib.mkIf cfg.firefox.enable {
        home-manager.users.${userName}.home.packages = with pkgs; [
            firefox
        ];

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