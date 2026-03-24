{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "xrender";
    vSync = false;

    shadow = true;
    shadowOffsets = [ (-6) (-6) ];
    shadowOpacity = 1.0;
    shadowExclude = [
      "window_type = 'desktop'"
      "_GTK_FRAME_EXTENTS@:c"
    ];

    fade = false;

    activeOpacity = 1.0;
    inactiveOpacity = 1.0;

    settings = {
      shadow-color = "#000000";
      shadow-radius = 0;
      blur-background = false;
      corner-radius = 0;
      detect-client-opacity = true;
      detect-transient = true;
      detect-client-leader = true;
      frame-opacity = 1.0;
    };
  };
}
