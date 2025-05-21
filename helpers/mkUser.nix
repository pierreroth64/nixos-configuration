{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
{ myuser }:
let
  defaultFeatureFlags = {
    cli = {
      git.enable = true;
      docker.enable = true;
      shells = {
        ${myuser.userShell}.enable = true;
      };
    };
    browsers = {
      default = "firefox";
      brave.enable = false;
      chromium.enable = false;
      firefox = {
        enable = true;
        extensions.ublock-origin.enable = true;
      };
    };
    editors = {
      vscode.enable = true;
    };
    office = {
      libreoffice.enable = true;
      gimp.enable = true;
    };
    chat = {
      slack.enable = true;
      whatsapp.enable = true;
    };
    currencies = {
      ledger.enable = false;
    };
    media = {
      spotify.enable = true;
      vlc.enable = true;
    };
    embedded.enable = true;
    eove.enable = false;
    network = {
      nmap.enable = true;
      wireshark.enable = true;
    };
    gaming = {
      steam.enable = true;
      bottles.enable = true;
    };
  };
in
{
  users.users.${myuser.userName} = {
    isNormalUser = true;
    shell = pkgs.${myuser.userShell};
    password = lib.mkIf (myuser.userPassword != "") myuser.userPassword;
    description = myuser.userName;
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
    ] ++ myuser.userExtraGroups;
  };

  users.groups.plugdev.members = [ myuser.userName ];
  users.groups.i2c.members = [ myuser.userName ];

  # you can overwrite default flags from your user declaration
  my.${myuser.userName} = lib.mkMerge [
    myuser.userFeatureFlags
    defaultFeatureFlags
  ];

  imports = [
    (import ../modules/home/index.nix myuser)
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."${myuser.userName}" = {
      home.username = myuser.userName;
      home.homeDirectory = "/home/${myuser.userName}";
      home.stateVersion = "24.11";
      xdg = {
        enable = true;
        mimeApps.defaultApplications = {
          "application/pdf" = config.my.${myuser.userName}."browsers.default"."desktop";
        };
      };
    };
  };
}
