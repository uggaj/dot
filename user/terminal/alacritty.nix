{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 5;
          y = 5;
        };
        opacity = 0.95;
      };
      font = {
        normal = {
          family = "SpaceMono Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "SpaceMono Nerd Font Mono";
          style = "Bold";
        };
        italic = {
          family = "SpaceMono Nerd Font Mono";
          style = "Italic";
        };
        size = 7;
      };
      colors = {
        primary = {
          background = "0x1b182c";
          foreground = "0xcbe3e7";
        };
        normal = {
          black = "0x100e23";
          red = "0xff8080";
          green = "0x95ffa4";
          yellow = "0xffe9aa";
          blue = "0x91ddff";
          magenta = "0xc991e1";
          cyan = "0xaaffe4";
          white = "0xcbe3e7";
        };
        bright = {
          black = "0x565575";
          red = "0xff5458";
          green = "0x62d196";
          yellow = "0xffb378";
          blue = "0x65b2ff";
          magenta = "0x906cff";
          cyan = "0x63f2f1";
          white = "0xa6b3cc";
        };
        cursor = {
          cursor = "0xcbe3e7";
          text = "0x1b182c";
        };
      };
    };
  };
}
