{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.browsers;
  extensions = [
    {
      shortId = "ublock-origin";
      uuid = "uBlock0@raymondhill.net";
    }
  ];
  mkEnableExtensionOption =
    with builtins;
    e: {
      name = e.shortId;
      value = lib.mkEnableOption "enable firefox browser extension ${e.shortId} for ${userName}";
    };
  mkExtension =
    with builtins;
    e: {
      name = e.uuid;
      value = {
        install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${e.shortId}/latest.xpi";
        installation_mode = "normal_installed";
      };
    };
in
{
  options = {
    my.${userName}.browsers.firefox = {
      enable = lib.mkEnableOption "enable firefox browser for ${userName}";
      extensions = with builtins; listToAttrs (map (e: mkEnableExtensionOption e) extensions);
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
          ExtensionSettings = with builtins; listToAttrs (map (e: mkExtension e) extensions);
        };
      };
    };
  };
}
