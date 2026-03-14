{ config, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;

    extraPackages = epkgs: with epkgs; [
      use-package

      nerd-icons
      dashboard
      doom-modeline
      which-key

      ivy
      counsel
      ivy-rich
      company
      company-box

      treemacs
      treemacs-nerd-icons

      magit

      rainbow-delimiters
      hl-todo
      aggressive-indent
      ws-butler

      rust-mode
      nix-mode
    ];
  };

  fonts.fontconfig.enable = true;

  home.file.".config/emacs/init.el".source = ./init.el;
  home.file.".config/emacs/images".source = ./images;
}
