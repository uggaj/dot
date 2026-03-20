{ config, pkgs, ... }:

{
  home.packages = [ pkgs.fastfetch ];
  xdg.configFile."fastfetch".source =
    config.lib.file.mkOutOfStoreSymlink "/home/uebrmensch/.nixos/user/config/fastfetch";
}
