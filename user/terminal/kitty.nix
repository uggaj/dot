{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "SpaceMono Nerd Font";
      font_size   = 10;
      background  = "#C0C0C0";
      foreground  = "#000000";
      cursor      = "#000000";
      cursor_text_color       = "#C0C0C0";
      selection_background    = "#0000AA";
      selection_foreground    = "#FFFFFF";
      background_opacity      = "1.0";
      window_padding_width    = 4;
      hide_window_decorations = "yes";
      tab_bar_style           = "separator";
      tab_separator           = " | ";
      tab_bar_background      = "#808080";
      active_tab_background   = "#C0C0C0";
      active_tab_foreground   = "#000000";
      inactive_tab_background = "#A0A0A0";
      inactive_tab_foreground = "#444444";
      color0  = "#000000"; color1  = "#AA0000";
      color2  = "#00AA00"; color3  = "#AA5500";
      color4  = "#0000AA"; color5  = "#AA00AA";
      color6  = "#00AAAA"; color7  = "#C0C0C0";
      color8  = "#555555"; color9  = "#FF5555";
      color10 = "#55FF55"; color11 = "#FFFF55";
      color12 = "#5555FF"; color13 = "#FF55FF";
      color14 = "#55FFFF"; color15 = "#FFFFFF";
      confirm_os_window_close = 0;
      enabled_layouts = "tall,*";
    };
    keybindings = {
      "ctrl+c"       = "copy_or_interrupt";
      "ctrl+v"       = "paste_from_clipboard";
      "ctrl+shift+t" = "launch --type=tab --cwd=current";
      "ctrl+shift+v" = "launch --location=vsplit --cwd=current";
      "ctrl+shift+h" = "neighboring_window left";
      "ctrl+shift+j" = "neighboring_window down";
      "ctrl+shift+k" = "neighboring_window up";
      "ctrl+shift+l" = "neighboring_window right";
    };
  };
}
