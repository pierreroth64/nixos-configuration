{ userName, userEmail, ... }:
{
  pkgs,
  lib,
  ...
}:
let
  alt = "alt";
  shift = "shift";
in
{
  home-manager.users.${userName} = {
    programs = {
      kitty = {
        enable = true;
        keybindings = {
          "${alt}+c" = "copy_to_clipboard";
          "${alt}+v" = "paste_from_clipboard";
          "${alt}+t" = "new_tab_with_cwd";
          "${alt}+LEFT" = "previous_tab";
          "${alt}+RIGHT" = "next_tab";
          "${alt}+w" = "close_window";
          "${alt}+k" = "clear_terminal scrollback active";
          "${alt}+ENTER" = "toggle_maximized";
          "${alt}+UP" = "scroll_line_up";
          "${alt}+DOWN" = "scroll_line_down";
          "${alt}+=" = "change_font_size all +1.0";
          "${alt}+-" = "change_font_size all -1.0";
          "${alt}+à" = "change_font_size all 0";
          "ctrl+${alt}+UP" = "scroll_page_up";
          "ctrl+${alt}+DOWN" = "scroll_page_down";
          "ctrl+${shift}+ENTER" = "new_window";
          "ctrl+${shift}+${alt}+LEFT" = "neighboring_window left";
          "ctrl+${shift}+${alt}+RIGHT" = "neighboring_window right";
          "ctrl+${shift}+${alt}+UP" = "neighboring_window up";
          "ctrl+${shift}+${alt}+DOWN" = "neighboring_window down";
          "ctrl+${shift}+LEFT" = "resize_window narrower";
          "ctrl+${shift}+RIGHT" = "resize_window wider";
          "ctrl+${shift}+UP" = "resize_window taller";
          "ctrl+${shift}+DOWN" = "resize_window shorter";
        };
      };
    };
  };
}
