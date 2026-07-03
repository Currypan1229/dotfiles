{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    config = {
      terminal = "${pkgs.wezterm}/bin/wezterm start --";
    };
  };
}
