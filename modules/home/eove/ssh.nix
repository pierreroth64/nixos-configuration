{
  userName,
  userSSHIdentityFile,
  userSSHIdentitySecondaryFile,
  ...
}:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.eove;
in
{

  config = lib.mkIf cfg.enable {
    home-manager.users.${userName} = {
      programs.ssh = {
        enable = true;
        extraConfig = "verifyHostKeyDNS = yes";
        matchBlocks = {
          "github.com" = {
            identityFile = userSSHIdentityFile;
          };
          "remote-access" = {
            identityFile = userSSHIdentityFile;
            hostname = "remote-access.eove.fr";
            user = "root";
          };
          "remote-access-rsa" = {
            identityFile = userSSHIdentitySecondaryFile;
            hostname = "remote-access.eove.fr";
            user = "root";
          };
          "testlab-via-remoteaccess" = {
            hostname = "localhost";
            port = 1111;
            proxyJump = "remote-access";
            user = "testlab";
          };
          "cq-el-26-via-remoteaccess" = {
            hostname = "localhost";
            port = 8888;
            # this bench does not know to deal with ed25519 keys
            proxyJump = "remote-access-rsa";
            user = "eoveadm";
          };
          "cq-el-64-via-remoteaccess" = {
            hostname = "localhost";
            port = 5555;
            proxyJump = "remote-access";
            user = "eoveadm";
          };
          "cq-el-65-via-remoteaccess" = {
            hostname = "localhost";
            port = 5556;
            proxyJump = "remote-access";
            user = "eoveadm";
          };
          "cq-el-36-via-remoteaccess" = {
            hostname = "localhost";
            port = 6666;
            proxyJump = "remote-access";
            user = "eoveadm";
          };
          "cq-el-27-via-remoteaccess" = {
            hostname = "localhost";
            port = 9999;
            proxyJump = "remote-access";
            user = "eoveadm";
          };
        };
      };
    };
  };
}
