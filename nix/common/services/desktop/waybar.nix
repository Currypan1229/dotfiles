{ pkgs, ... }:

{
  programs.waybar.enable = true;

  home-manager.sharedModules = [(
    { pkgs, ... }:
    {
      programs.waybar = {
        enable = true;
	settings = {
	  mainBar = {
	    layer = "top";
	    position = "bottom";

	    modules-left = [ "sway/workspace" "sway/mode" ];
	    modules-center = [ "clock" ];
	    modules-right = [ "network" "cpu" "memory" "battery" "tray" ];

	    "sway/workspace" = {
	      disable-scroll = false;
	      all-outputs = true;
	    };

	    "clock" = {
	      format = "{:%Y-%m-%d %H'%M}";
	    };
	  };
	};

	#style = ''
	#  window#waybar {
	#    background-color: rgba(43, 48, 59, 0.5);
	#    color: #ffffff;
	#  }
	#'';
      };
    }
  )];
}
