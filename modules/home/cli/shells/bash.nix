{ userName, userCLIEditor, ... }:
{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.my.${userName}.cli.shells;
in
{
  options = {
    my.${userName}.cli.shells.bash.enable = lib.mkEnableOption "enable bash for ${userName}";
  };

  config = lib.mkIf cfg.bash.enable {

    programs.bash.interactiveShellInit = ''
      eval "$(starship init bash)"
    '';

    home-manager.users.${userName}.programs = {
      bash = {
        enable = true;
        sessionVariables = {
          EDITOR = userCLIEditor;
        };
      };
    };
  };
}
