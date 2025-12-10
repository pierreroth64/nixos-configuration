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
        editor = {
          indent-guides = {
            render = true;
            character = "▏";
            skip-levels = 1;
          };
          cursor-shape = {
            insert = "bar";
          };
          file-picker = {
            hidden = false;
          };
          statusline = {
            left = [
              "mode"
              "spinner"
              "file-name"
              "read-only-indicator"
              "file-modification-indicator"
              "separator"
              "spacer"
              "version-control"
            ];
            right = [
              "position"
              "separator"
              "total-line-numbers"
            ];
          };
        };
        keys = {
          normal = {
            "left" = "no_op";
            "right" = "no_op";
            "up" = "no_op";
            "down" = "no_op";
          };
          insert = {
            "left" = "no_op";
            "right" = "no_op";
            "up" = "no_op";
            "down" = "no_op";

            # to be able to move in insert mode
            "C-h" = "move_char_left";
            "C-l" = "move_char_right";
            "C-j" = "move_line_down";
            "C-k" = "move_line_up";
            "C-w" = "move_next_word_start";
            "C-b" = "move_prev_word_start";
          };
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
            auto-pairs = {
              "(" = ")";
              "{" = "}";
              "[" = "]";
              "\"" = "\"";
              "<" = ">";
            };
          }
          {
            name = "typescript";
            language-servers = [ "typescript-language-server"];
          }
        ];
      };
    };
  };
}
