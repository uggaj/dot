{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "xrender";
    vSync = false;
    extraConfig = ''
      use-damage = true;
      shadow = true;
      shadow-radius = 2;
      shadow-offset-x = 8;
      shadow-offset-y = 8;
      shadow-opacity = 1.0;
      shadow-exclude = [
        "window_type = 'desktop'",
        "_GTK_FRAME_EXTENTS@:c"
      ];
      corner-radius = 0;
      detect-rounded-corners = false;
      detect-client-opacity = true;
      detect-transient = true;
      detect-client-leader = true;
    '';
  };
}
