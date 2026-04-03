{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      enabled_layouts = "tall,*";
      window_padding_width = 5;
      font_family = "SpaceMono Nerd Font Mono";
      font_size = 10;
      background_opacity = "0.95";
      tab_bar_style = "powerline";
      background = "#CECECE";
      foreground = "#000000";
      cursor = "#000000";
      cursor_text_color = "#CECECE";
      color0 = "#000000";
      color1 = "#AA0000";
      color2 = "#000000";
      color3 = "#000000";
      color4 = "#000000";
      color5 = "#000000";
      color6 = "#000000";
      color7 = "#000000";
      color8 = "#000000";
      color9 = "#AA0000";
      color10 = "#000000";
      color11 = "#000000";
      color12 = "#000000";
      color13 = "#000000";
      color14 = "#000000";
      color15 = "#000000";
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+shift+t" = "launch --type=tab --cwd=current";
      "ctrl+shift+v" = "launch --location=vsplit --cwd=current";
      "ctrl+shift+h" = "neighboring_window left";
      "ctrl+shift+j" = "neighboring_window down";
      "ctrl+shift+k" = "neighboring_window up";
      "ctrl+shift+l" = "neighboring_window right";
    };
  };
}
