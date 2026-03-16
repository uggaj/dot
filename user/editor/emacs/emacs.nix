{ config, pkgs, lib, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;

    extraPackages = epkgs: with epkgs; [
      use-package

      envrc
       
      nerd-icons
      dashboard
      doom-modeline
      doom-themes
      which-key

      ivy
      counsel
      ivy-rich
      company
      company-box
      eldoc-box
      treesit-auto

      treemacs
      treemacs-nerd-icons

      magit

      rainbow-delimiters
      hl-todo
      aggressive-indent
      ws-butler

      rust-mode
      nix-mode
      nix-ts-mode
    ];
  };

  fonts.fontconfig.enable = true;

  home.file.".config/emacs/init.el".source = ./init.el;
  home.file.".config/emacs/images".source = ./images;
  home.file.".config/emacs/early-init.el".source = ./early-init.el;

  home.activation.createEmacsCacheDirs = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p ~/.cache/emacs/backups
    mkdir -p ~/.cache/emacs/auto-saves
    mkdir -p ~/.cache/emacs/locks
  '';
}
