{ userName, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.editors;
in
{
  options = {
    my.${userName}.editors.vscode.enable = lib.mkEnableOption "enable vscode editor for ${userName}";
  };

  config = lib.mkIf cfg.vscode.enable {
    home-manager.users.${userName} = {
      home.packages = with pkgs.unstable; [
        vscode
      ];
      programs.vscode.keybindings = [
        {
          key = "Ctrl + PageUp";
          command = "editor.action.moveLinesUpAction";
        }
        {
          key = "Ctrl + PageDown";
          command = "editor.action.moveLinesDownAction";
        }
      ];
    };
  };
}
