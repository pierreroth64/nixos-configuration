{ pkgs, inputs, ... }@args:
let
  myuser = {
    userName = "peio";
    userEmail = "pierreroth64@gmail.com";
  };
in
{
  users.users.${myuser.userName} = {
    isNormalUser = true;
    description = myuser.userName;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "dialout"
    ];
  };
  users.groups.plugdev.members = [ myuser.userName ];
  users.groups.i2c.members = [ myuser.userName ];

  # you just have to toggle these flags to enable/disable a module for this user
  my.peio.cli.git.enable = true;
  my.peio.cli.utils.enable = true;
  my.peio.cli.shells.bash.enable = true;
  my.peio.cli.shells.zsh.enable = true;
  #my.peio.browsers.brave.enable = true;
  #my.peio.browsers.chromium.enable = true;
  my.peio.browsers.firefox.enable = true;
  my.peio.browsers.firefox.extensions.ublock-origin.enable = true;
  my.peio.editors.vscode.enable = true;
  my.peio.office.libreoffice.enable = true;
  my.peio.chat.whatsapp.enable = true;
  my.peio.chat.slack.enable = true;
  my.peio.currencies.ledger.enable = true;
  my.peio.media.spotify.enable = true;
  my.peio.media.vlc.enable = true;
  my.peio.embedded.enable = true;
  my.peio.eove.enable = true;

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
