{ config, pkgs, ... }:

let
  email = builtins.getEnv "JAGGU_EMAIL";
in
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "jaggu";
        email = email;
      };
      init.defaultBranch = "main";
    };
  };
}
