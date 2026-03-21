{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;

    extraPackages =
      epkgs: with epkgs; [
        use-package

        envrc

        nerd-icons
        dashboard
        doom-modeline
        doom-themes
        kanagawa-themes
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

  xdg.configFile."emacs".source =
    config.lib.file.mkOutOfStoreSymlink "/home/jaggu/.nixos/user/editor/emacs";

  home.activation.createEmacsCacheDirs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ~/.cache/emacs/backups
    mkdir -p ~/.cache/emacs/auto-saves
    mkdir -p ~/.cache/emacs/locks
  '';
}
