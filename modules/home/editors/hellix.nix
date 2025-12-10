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
    my.${userName}.editors.helix.enable = lib.mkEnableOption "enable helix editor for ${userName}";
  };

  config = lib.mkIf cfg.helix.enable {

    home-manager.users.${userName}.programs.helix = {
      enable = true;
      settings = {
        cursor-shape = {
          insert = "bar";
        };
      };
      languages = {
        language = [
          {
            name = "rust";
            formatter = {
              command = "rustfmt";
              args = [ ];
            };
            language-servers = [ "rust-analyzer" ];
            roots = [ "Cargo.lock" ];
          }
        ];
      };
    };
  };
}
