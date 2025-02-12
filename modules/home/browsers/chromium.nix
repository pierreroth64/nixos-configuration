{ userName, ... }:
{ pkgs, lib, config, ...}:
let
    cfg = config.my.${userName}.browsers;
in
{
    options = {
        my.${userName}.browsers.chromimum.enable = lib.mkEnableOption "enable chromimum browser for ${userName}";
    };
    
    config = lib.mkIf cfg.chromimum.enable {
        home-manager.users.${userName}.home.packages = with pkgs; [
            chromimum
        ];

        programs.chromium.enable = true;
    };
}