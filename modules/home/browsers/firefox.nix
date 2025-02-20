{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.browsers;
in
{
  options = {
    my.${userName}.browsers.firefox = {
      enable = lib.mkEnableOption "enable firefox browser for ${userName}";
      extensions =
        with builtins;
        let
          mkEnableExtensionOption = shortId: {
            name = shortId;
            value = lib.mkEnableOption "enable firefox browser extension ${shortId} for ${userName}";
          };
        in
        listToAttrs [
          (mkEnableExtensionOption "ublock-origin")
        ];
    };
  };

  config = lib.mkIf cfg.firefox.enable {
    home-manager.users.${userName}.home.packages = with pkgs.unstable; [
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
