{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    config = {
      menu = "${pkgs.fuzzel}/bin/fuzzel";
    };
  };
}
