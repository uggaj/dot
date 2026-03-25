{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      "font-family" = "SpaceMono Nerd Font Mono";
      "font-size" = 10;
      "font-synthetic-style" = "bold";
      "background" = "#CECECE";
      "foreground" = "#000000";
      "cursor-color" = "#000000";
      "cursor-text" = "#CECECE";
      "background-opacity" = 0.95;
      "window-padding-x" = 6;
      "window-padding-y" = 6;
      "window-decoration" = false;
      "palette" = [
        "0=#000000"
        "1=#AA0000"
        "2=#000000"
        "3=#000000"
        "4=#000000"
        "5=#000000"
        "6=#000000"
        "7=#000000"
        "8=#000000"
        "9=#AA0000"
        "10=#000000"
        "11=#000000"
        "12=#000000"
        "13=#000000"
        "14=#000000"
        "15=#000000"
      ];
    };
  };
}
