{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      if [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]; then
        eval "$(${pkgs.starship}/bin/starship init bash)"
      fi
      source ${pkgs.blesh}/share/blesh/ble.sh
    '';
    shellAliases = {
      ll = "eza -l --icons";
      la = "eza -a --icons";
      lt = "eza -T --icons";
      y = "yazi";
    };
  };
}
