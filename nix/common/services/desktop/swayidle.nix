{ pkgs, ... }:

{
  programs.sway.extraPackages = with pkgs; [
    swayidle
  ];

  home-manager.sharedModules = [(
    { pkgs, lib, ... }:
    {

      services.swayidle = {
        enable = true;
	extraArgs = [ "-w" ];

        timeouts = [
          {
            timeout = 120;
            command = "${pkgs.brightnessctl}/bin/brightnessctl -s set 25%";
            resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r";
          }
          {
            timeout = 300;
            command = "${pkgs.swaylock}/bin/swaylock -f";
          }
          {
            timeout = 600;
            command = "${pkgs.sway}/bin/swaymsg \"output * power off\"";
            resumeCommand = "${pkgs.sway}/bin/swaymsg \"output * power on\"";
          }
          {
            timeout = 1200;
            command = "/run/current-system/sw/bin/systemctl suspend";
          }
        ];
        events = [
          { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -f"; }
        ];
      };
    }
  )];
}
