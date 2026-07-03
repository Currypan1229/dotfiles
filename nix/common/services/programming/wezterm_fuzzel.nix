{ pkgs, ... }:

{
  programs.fuzzel = {
    settings = {
      main = {
        terminal = "${pkgs.wezterm}/bin/wezterm start --";
       };
    };
  };
} 
