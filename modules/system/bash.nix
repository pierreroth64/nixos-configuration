{
  pkgs,
  lib,
  config,
  ...
}:
{
  environment = {
    systemPackages = with pkgs; [
      bash
    ];
  };
  programs.bash = {
    interactiveShellInit = ''
      eval "$(starship init bash)"
      eval "$(direnv hook bash)"
      eval "$(zoxide init bash)"
      eval "$(thefuck --alias)"
    '';
  };
}
