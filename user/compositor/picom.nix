{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "xrender";
    vSync = false;
    extraConfig = ''
      shadow = true;
      shadow-radius = 0;
      shadow-offset-x = -6;
      shadow-offset-y = -6;
      shadow-opacity = 1.0;
      shadow-color = "#000000";
      shadow-exclude = [ "window_type = 'desktop'", "_GTK_FRAME_EXTENTS@:c" ];
      inactive-opacity = 1.0;
      active-opacity   = 1.0;
      frame-opacity    = 1.0;
      fading = false;
      blur-background = false;
      corner-radius = 0;
      detect-client-opacity = true;
      detect-transient = true;
      detect-client-leader = true;
    '';
  };
}
