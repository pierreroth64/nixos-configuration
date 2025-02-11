{ pkgs, ... }:

{
    environment = {
        systemPackages = with pkgs; [
            gnupg
        ];
    };
    programs = {
        ssh = {
            startAgent = true;
        };
        gnupg = {
            agent = {
                enable = true;
                # enableSSHSupport = true;
            };
        };
    };
}