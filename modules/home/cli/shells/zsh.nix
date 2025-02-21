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
    my.${userName}.cli.shells.zsh.enable = lib.mkEnableOption "enable zsh for ${userName}";
  };

  config = lib.mkIf cfg.zsh.enable {
    programs.zsh.interactiveShellInit = ''
      eval "$(starship init zsh)"
      eval "$(direnv hook zsh)"
    '';

    home-manager.users.${userName} = {
      programs = {
        zsh = {
          enable = true;
          sessionVariables = {
            EDITOR = userCLIEditor;
          };
        };
      };
    };
  };
}
