{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extensions = [
      "nix"
      "toml"
      "rust"
      "c"
      "catppuccin"
    ];
    userSettings = {
      theme = "Catppuccin Mocha";
      buffer_font_family = ".ZedMono";
      buffer_font_size = 11;
      ui_font_size = 11;
      buffer_font_features = {
        calt = true;
      };
      format_on_save = "on";
      autosave = "on_focus_change";
      tab_size = 2;
      hard_tabs = false;
      vim_mode = true;
      experimental_theme_overrides = {
        syntax = {
          keyword = { font_style = "italic"; };
          type = { font_style = "italic"; };
          "keyword.control" = { font_style = "italic"; };
        };
      };
      languages = {
        Nix = {
          language_servers = [ "nixd" "!nil" ];
          formatter = {
            external = {
              command = "nixfmt";
              arguments = [ "--" ];
            };
          };
        };
        Rust = {
          language_servers = [ "rust-analyzer" ];
          format_on_save = "on";
          tab_size = 4;
        };
        C = {
          language_servers = [ "clangd" ];
          format_on_save = "on";
          tab_size = 4;
        };
      };
    };
  };
  xdg.configFile."zed/keymap.json".source =
    config.lib.file.mkOutOfStoreSymlink "/home/jaggu/.nixos/user/editor/zed/keymap.json";
  home.activation.createZedCacheDirs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ~/.local/share/zed/{extensions,languages}
    mkdir -p ~/.cache/zed
  '';
}
