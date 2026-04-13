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
      background_opacity = "1.0";
      tab_bar_style = "powerline";
      foreground = "#cbe3e7";
      background = "#1b182c";
      selection_background = "#fbfcfc";
      color0 = "#565575";
      color8 = "#a6b3cc";
      color1 = "#ff8080";
      color9 = "#ff5458";
      color2 = "#95ffa4";
      color10 = "#62d196";
      color3 = "#ffe9aa";
      color11 = "#ffb378";
      color4 = "#91ddff";
      color12 = "#65b2ff";
      color5 = "#c991e1";
      color13 = "#906cff";
      color6 = "#aaffe4";
      color14 = "#63f2f1";
      color7 = "#cbe3e7";
      color15 = "#a6b3cc";
      active_tab_foreground = "#1e1c31";
      active_tab_background = "#cbe3e7";
      inactive_tab_foreground = "#1e1e1e";
      inactive_tab_background = "#9d9d9d";
    };
  };
}
