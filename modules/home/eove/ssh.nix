{
  userName,
  userSSHIdentityFile,
  ...
}:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName};
in
{

  config = {
    home-manager.users.${userName} = {
      programs.ssh = {
        enable = true;
        extraConfig = "verifyHostKeyDNS = yes";
        matchBlocks = lib.mkIf cfg.eove.enable {
          "github.com" = {
            identityFile = "~/.ssh/" + userSSHIdentityFile;
          };
          "remote-access" = {
            identityFile = "~/.ssh/" + userSSHIdentityFile;
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
            port = 5556;
            proxyJump = "remote-access";
            user = "eoveadm";
          };
          "cq-el-64-via-remoteaccess" = {
            hostname = "localhost";
            port = 5555;
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
