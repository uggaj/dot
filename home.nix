{ config, pkgs, ... }:

{
  imports = [
    ./user/shell/bash.nix
    ./user/shell/starship.nix
    ./user/terminal/kitty.nix
    ./user/terminal/fastfetch.nix
    ./user/suckless/suckless.nix
    ./user/compositor/picom.nix
    ./user/editor/emacs/emacs.nix
  ];
  home.username = "jaggu";
  home.homeDirectory = "/home/jaggu";
  home.stateVersion = "25.11";
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "jaggu";
        email = "jaggu@noreply.codeberg.org";
      };
      init.defaultBranch = "main";
    };
  };
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
    aria2
    bat
    bash-language-server
    brave
    btop
    eza
    fd
    flameshot
    fzf
    lua-language-server
    luajitPackages.luacheck
    ncdu
    nixd
    nixfmt
    nsxiv
    pavucontrol
    qalculate-gtk
    ripgrep
    shfmt
    statix
    stylua
    tree-sitter
    unzip
    xclip
    xwallpaper
    yazi
  ];
}
