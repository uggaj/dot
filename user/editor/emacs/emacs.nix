{ config, pkgs, ... }:

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

  home.file.".cache/emacs/backups".directory = true;
  home.file.".cache/emacs/auto-saves".directory = true;
  home.file.".cache/emacs/locks".directory = true;
}
