{ pkgs, inputs, ... }@args:
let
  myuser = {
    userName = "peio";
    userEmail = "pierreroth64@gmail.com";
    userCLIEditor = "vim";
    userShell = "fish";
  };
in
{
  users.users.${myuser.userName} = {
    isNormalUser = true;
    shell = pkgs.${myuser.userShell};
    description = myuser.userName;
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
    ];
  };
  users.groups.plugdev.members = [ myuser.userName ];
  users.groups.i2c.members = [ myuser.userName ];

  # you just have to toggle these flags to enable/disable packages for this user
  my.${myuser.userName} = {
    cli = {
      git.enable = true;
      docker.enable = true;
      shells = {
        ${myuser.userShell}.enable = true;
      };
    };
    browsers = {
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
    };
    chat = {
      slack.enable = true;
      whatsapp.enable = true;
    };
    currencies = {
      ledger.enable = true;
    };
    media = {
      spotify.enable = true;
      vlc.enable = true;
    };
    embedded.enable = true;
    eove.enable = true;
    network = {
      nmap.enable = true;
      wireshark.enable = true;
    };
    gaming = {
      steam.enable = true;
      bottles.enable = true;
    };
  };

  imports = [
    (import ../modules/home/index.nix myuser)
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."${myuser.userName}" = {
      home.username = myuser.userName;
      home.homeDirectory = "/home/${myuser.userName}";
      home.stateVersion = "24.11";
    };
  };
}
