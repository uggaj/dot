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
        ivy
        counsel
        which-key
        company
        ws-butler
        hl-todo
        treesit-auto
        magit
        rust-mode
        nix-mode
        nix-ts-mode
      ];
  };
  fonts.fontconfig.enable = true;
  xdg.configFile."emacs".source =
    config.lib.file.mkOutOfStoreSymlink "/home/jaggu/.nixos/user/editor/emacs";
  home.activation.createEmacsCacheDirs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ~/.cache/emacs/{backups,auto-saves,locks}
  '';
}
