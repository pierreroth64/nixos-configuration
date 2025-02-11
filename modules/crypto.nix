{ pkgs, ... }:

{
    environment = {
        systemPackages = with pkgs; [
            gnupg
            ledger-live-desktop
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