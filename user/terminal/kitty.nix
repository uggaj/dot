{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      enabled_layouts = "tall,*";
      window_padding_width = 5;
      font_family = "SpaceMono Nerd Font";
      font_size = 10;
      background_opacity = "0.90";
      tab_bar_style = "powerline";
      background = "#1b182c";
      foreground = "#cbe3e7";
      cursor = "#cbe3e7";
      selection_background = "#fbfcfc";
      color0 = "#565575";
      color1 = "#ff8080";
      color2 = "#95ffa4";
      color3 = "#ffe9aa";
      color4 = "#91ddff";
      color5 = "#c991e1";
      color6 = "#aaffe4";
      color7 = "#cbe3e7";
      color8 = "#a6b3cc";
      color9 = "#ff5458";
      color10 = "#62d196";
      color11 = "#ffb378";
      color12 = "#65b2ff";
      color13 = "#906cff";
      color14 = "#63f2f1";
      color15 = "#a6b3cc";
      active_tab_foreground = "#1e1c31";
      active_tab_background = "#cbe3e7";
      inactive_tab_foreground = "#1e1e1e";
      inactive_tab_background = "#9d9d9d";
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
