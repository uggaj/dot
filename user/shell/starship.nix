{ pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = false;

    settings = {
      "$schema" = "https://starship.rs/config-schema.json";
      add_newline = true;

      format = lib.concatStrings [
        "╭"
        "$os"
        "$cmd_duration"
        "$battery"
        "$character"
        "$status"
        "$sudo"
        "$env_var"
        "$username"
        "$hostname"
        "$localip"
        "$directory"
        "$git_branch"
        "$git_status"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$fossil_branch"
        "$fossil_metrics"
        "$hg_branch"
        "$pijul_channel"
        "$vcsh"
        "$buf"
        "$bun"
        "$c"
        "$cmake"
        "$cobol"
        "$conda"
        "$crystal"
        "$daml"
        "$dart"
        "$deno"
        "$dotnet"
        "$elixir"
        "$elm"
        "$erlang"
        "$fennel"
        "$fortran"
        "$gleam"
        "$golang"
        "$gradle"
        "$haxe"
        "$helm"
        "$haskell"
        "$java"
        "$julia"
        "$kotlin"
        "$lua"
        "$meson"
        "$mise"
        "$mojo"
        "$nats"
        "$nim"
        "$nix_shell"
        "$nodejs"
        "$ocaml"
        "$odin"
        "$opa"
        "$package"
        "$perl"
        "$php"
        "$pulumi"
        "$purescript"
        "$python"
        "$quarto"
        "$raku"
        "$red"
        "$rlang"
        "$ruby"
        "$scala"
        "$rust"
        "$spack"
        "$swift"
        "$terraform"
        "$typst"
        "$vagrant"
        "$vlang"
        "$xmake"
        "$zig"
        "$aws"
        "$azure"
        "$docker_context"
        "$gcloud"
        "$guix_shell"
        "$kubernetes"
        "$openstack"
        "$pixi"
        "$singularity"
        "$time"
        "$shlvl"
        "$jobs"
        "$shell"
        "$line_break"
        "╰> "
      ];

      # Palettes
      palette = "dark";
      palettes.light = {
        success_fg = "green";
        error_fg = "red";
        fg_1 = "black";
        bg_1 = "white";
      };
      palettes.dark = {
        success_fg = "green";
        error_fg = "red";
        fg_1 = "brightwhite";
        bg_1 = "darkblack";
      };

      line_break.disabled = false;

      os = {
        disabled = false;
        style = "fg:fg_1 bg:bg_1";
        format = "[ $symbol ]($style)";
        symbols = {
          Alpine = "ALPN";
          Arch = "ARCH";
          Debian = "DEB";
          Fedora = "FED";
          Gentoo = "GNT";
          Linux = "LNX";
          Macos = "OSX";
          NixOS = "NIX";
          Ubuntu = "UBT";
          Windows = "WIN";
        };
      };

      battery = {
        disabled = false;
        full_symbol = "FULL ";
        charging_symbol = "CHG ";
        discharging_symbol = "BAT ";
        empty_symbol = "EMPTY";
        format = "[ $symbol$percentage ]($style)";
        display = [
          {
            threshold = 100;
            style = "fg:fg_1 bg:bg_1";
          }
        ];
      };

      cmd_duration = {
        format = "[ $duration ]($style)";
        style = "fg:fg_1 bg:bg_1";
      };

      character = {
        success_symbol = "[OK](fg:success_fg bg:bg_1)";
        error_symbol = "[ERR](fg:error_fg bg:bg_1)";
        format = "[ $symbol ](fg:fg_1 bg:bg_1)";
      };

      status = {
        disabled = false;
        format = "[$status:$common_meaning ](fg:error_fg bg:bg_1)";
      };

      sudo = {
        disabled = false;
        symbol = "ROOT";
        style = "fg:fg_1 bg:bg_1";
        format = "[ $symbol ]($style)";
      };

      username = {
        show_always = true;
        style_user = "fg:fg_1 bg:bg_1";
        style_root = "fg:fg_1 bold bg:bg_1";
        format = "[ USR: ($user) ]($style)";
      };

      directory = {
        style = "fg:fg_1 bg:bg_1";
        format = "[ $read_only$path ]($style)";
        read_only = "(RO) ";
        truncation_length = 3;
        truncation_symbol = "…/";
        home_symbol = "~";
      };

      git_branch = {
        symbol = "GIT:";
        style = "fg:fg_1 bg:bg_1";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "fg:fg_1 bg:bg_1";
        format = "[ $all_status$ahead_behind ]($style)";
        up_to_date = "OK";
      };

      # Toolchains (Simplified mapping - repeat for all languages)
      rust = {
        symbol = "RS:";
        style = "fg:fg_1 bg:bg_1";
        format = "[ $symbol $version ]($style)";
      };
      c = {
        symbol = "C:";
        style = "fg:fg_1 bg:bg_1";
        format = "[ $symbol $version ]($style)";
      };
      lua = {
        symbol = "LUA:";
        style = "fg:fg_1 bg:bg_1";
        format = "[ $symbol $version ]($style)";
      };
      nodejs = {
        symbol = "JS:";
        style = "fg:fg_1 bg:bg_1";
        format = "[ $symbol $version ]($style)";
      };
      nix_shell = {
        symbol = "NIX:";
        style = "fg:fg_1 bg:bg_1";
        format = "[ $symbol $version ]($style)";
      };
      python = {
        symbol = "PY:";
        style = "fg:fg_1 bg:bg_1";
        format = "[ $symbol$version ]($style)";
      };

      time = {
        disabled = false;
        style = "fg:fg_1 bg:bg_1";
        format = "[ TIME: $time ]($style)";
      };

      shell = {
        disabled = false;
        zsh_indicator = "ZSH";
        bash_indicator = "BASH";
        style = "fg:fg_1 bg:bg_1";
        format = "[ $indicator ]($style)";
      };
    };
  };
}
