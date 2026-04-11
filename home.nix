{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./user/shell/bash.nix
    ./user/shell/starship.nix
    ./user/terminal/kitty.nix
    ./user/terminal/fastfetch.nix
    ./user/suckless/suckless.nix
    ./user/desktop/picom.nix
    ./user/editor/zed/zed.nix
  ];
  home.username = "jaggu";
  home.homeDirectory = "/home/jaggu";
  home.stateVersion = "25.11";
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
  gtk = {
    enable = true;
    font = {
      name = "SpaceMono Nerd Font";
      size = 10;
    };
  };
  home.packages = with pkgs; [
    arandr
    brave
    btop
    eza
    fd
    flameshot
    fzf
    helix
    ncdu
    nixd
    nixfmt
    qalculate-gtk
    ripgrep
    statix
    tree-sitter
    unzip
    xclip
    xwallpaper
    yazi
  ];
}
