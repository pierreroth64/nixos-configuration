{ pkgs, lib, config, ...}:
let
    cfg = config.my.editors;
in
{
    options = {
        my.editors.vscode.enable = lib.mkEnableOption "enable visual stodio code editor";
    };

    config = lib.mkIf cfg.vscode.enable {
        environment = {
            systemPackages = with pkgs; [
                vscode
            ];
        };
    };
}