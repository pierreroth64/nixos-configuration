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
      eval "$(direnv hook bash)"
      eval "$(zoxide init bash)"
      eval "$(thefuck --alias)"
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
