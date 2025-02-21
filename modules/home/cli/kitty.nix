{ userName, userEmail, ... }:
{
  pkgs,
  lib,
  ...
}:
let
  modifier = "alt";
in
{
  home-manager.users.${userName} = {
    programs = {
      kitty = {
        enable = true;
        keybindings = {
          "${modifier}+c" = "copy_to_clipboard";
          "${modifier}+v" = "paste_from_clipboard";
          "${modifier}+t" = "new_tab_with_cwd";
          "${modifier}+LEFT" = "previous_tab";
          "${modifier}+RIGHT" = "next_tab";
          "${modifier}+w" = "close_window";
          "${modifier}+k" = "clear_terminal scrollback active";
          "${modifier}+ENTER" = "toggle_maximized";
          "${modifier}+UP" = "scroll_line_up";
          "${modifier}+DOWN" = "scroll_line_down";
          "shift+${modifier}+UP" = "scroll_page_up";
          "shift+${modifier}+DOWN" = "scroll_page_down";
          "${modifier}+=" = "change_font_size all +1.0";
          "${modifier}+-" = "change_font_size all -1.0";
          "${modifier}+à" = "change_font_size all 0";
        };
      };
    };
  };
}
