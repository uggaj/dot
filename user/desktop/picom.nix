{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";
    shadow = true;
    shadowOffsets = [
      (-10)
      (-10)
    ];
    shadowOpacity = 0.6;
    shadowExclude = [
      "name = 'Notification'"
      "class_g = 'dmenu'"
      "_GTK_FRAME_EXTENTS@:c"
    ];
    fade = true;
    fadeDelta = 8;
    fadeSteps = [
      0.06
      0.06
    ];
    activeOpacity = 1.0;
    inactiveOpacity = 0.88;
    opacityRules = [
      "95:class_g = 'Alacritty'"
      "100:class_g = 'Emacs'"
      "100:class_g = 'virt-manager'"
    ];
    settings = {
      blur = {
        method = "dual_kawase";
        strength = 4;
        background = true;
      };
      corner-radius = 8;
      rounded-corners-exclude = [
        "class_g = 'dwm'"
        "class_g = 'dmenu'"
      ];
      shadow-color = "#100e23";
      vsync = true;
      use-damage = true;
    };
  };
}
