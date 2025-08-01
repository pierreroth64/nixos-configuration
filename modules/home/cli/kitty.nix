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
        settings = {
          active_border_color = "#00ff00";
          draw_minimal_borders = "no";
          window_margin_width = "3";
          window_padding_width = "3";
          window_border_width = "2pt";
          copy_on_select = "clipboard";
        };
        keybindings = {
          "${alt}+c" = "copy_to_clipboard";
          "${alt}+v" = "paste_from_clipboard";
          "${alt}+t" = "new_tab_with_cwd";
          "${alt}+LEFT" = "previous_tab";
          "${alt}+RIGHT" = "next_tab";
          "${alt}+w" = "close_window";
          "${alt}+k" = "clear_terminal clear active";
          "${alt}+ENTER" = "toggle_maximized";
          "${alt}+UP" = "scroll_line_up";
          "${alt}+DOWN" = "scroll_line_down";
          "ctrl+UP" = "scroll_page_up";
          "ctrl+DOWN" = "scroll_page_down";
          "${alt}+=" = "change_font_size all +1.0";
          "${alt}+-" = "change_font_size all -1.0";
          "${alt}+à" = "change_font_size all 0";
          "ctrl+${shift}+ENTER" = "launch --cwd=current";
          "ctrl+${shift}+LEFT" = "resize_window narrower";
          "ctrl+${shift}+RIGHT" = "resize_window wider";
          "ctrl+${shift}+UP" = "resize_window taller";
          "ctrl+${shift}+DOWN" = "resize_window shorter";
          "${shift}+${alt}+LEFT" = "neighboring_window left";
          "${shift}+${alt}+RIGHT" = "neighboring_window right";
          "${shift}+${alt}+UP" = "neighboring_window up";
          "${shift}+${alt}+DOWN" = "neighboring_window down";
        };
      };
    };
  };
}
