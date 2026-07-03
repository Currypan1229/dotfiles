{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    config = {
      bars = [
        #{ command = "${pkgs.waybar}/bin/waybar"; }
      ];
    };

    extraConfig = ''
      bar {
        mode hide
	modifier none
	swaybar_command true
        #swaybar_command ${pkgs.waybar}/bin/waybar
      }
    '';
  };
}
