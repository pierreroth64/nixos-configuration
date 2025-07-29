{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
{ myuser }:
let
  home = config.users.users.${myuser.userName}.home;
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
      android-studio.enable = true;
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
      ffmpeg.enable = true;
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
    ]
    ++ myuser.userExtraGroups;
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

  sops.templates."${myuser.userName}.github.token" = {
      content = ''
            access-tokens = github.com=${config.sops.placeholder."users/${myuser.userName}/github/token"}
      '';
      path = "${home}/.config/nix/nix.conf";
      owner = config.users.users.${myuser.userName}.name;
    };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."${myuser.userName}" = {
      home.username = myuser.userName;
      home.homeDirectory = "/home/${myuser.userName}";
      home.stateVersion = "25.05";
      xdg = {
        enable = true;
        mimeApps.defaultApplications = {
          "application/pdf" = config.my.${myuser.userName}."browsers.default"."desktop";
        };
      };
      home.sessionVariables = {
          EDITOR = myuser.userCLIEditor;
      };
    };
  };
}
