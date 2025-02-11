{ pkgs, ...}:
{
    environment = {
        systemPackages = with pkgs; [
            git
            gitFull
        ];
    };
}