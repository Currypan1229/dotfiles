{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
      
    #extraPackages = with pkgs; [
    #  swaylock
    #        swayidle
    #        wl-clipboard
    #        mako
    #        wofi
    #];

    #extraSessionCommands = ''
    #  export TERMNAL=wezterm
    #'';
  };

  home-manager.sharedModules = [(
    { config, pkgs, lib, ... }:
    {
      imports = [
        ./swayidle_sway.nix
        ./fuzzel_sway.nix
        ./waybar_sway.nix
        ../programming/wezterm_sway.nix
      ];


      wayland.windowManager.sway = {
        enable = true;
	checkConfig = false;

	config = {
          window.titlebar = false;

          startup = [
	    { command = "${pkgs.fcitx5}/bin/fcitx5 -d"; }
	  ];

          modifier = "Mod4";

	  keybindings = let
	    cfg = config.wayland.windowManager.sway.config;
	    mod = cfg.modifier;
	  in lib.mkForce {
# Switch workspace
"${mod}+0" = "workspace number 10";
"${mod}+1" = "workspace number 1";
"${mod}+2" = "workspace number 2";
"${mod}+3" = "workspace number 3";
"${mod}+4" = "workspace number 4";
"${mod}+5" = "workspace number 5";
"${mod}+6" = "workspace number 6";
"${mod}+7" = "workspace number 7";
"${mod}+8" = "workspace number 8";
"${mod}+9" = "workspace number 9";

# Move window to workspace
"${mod}+Shift+0" = "move container to workspace number 10";
"${mod}+Shift+1" = "move container to workspace number 1";
"${mod}+Shift+2" = "move container to workspace number 2";
"${mod}+Shift+3" = "move container to workspace number 3";
"${mod}+Shift+4" = "move container to workspace number 4";
"${mod}+Shift+5" = "move container to workspace number 5";
"${mod}+Shift+6" = "move container to workspace number 6";
"${mod}+Shift+7" = "move container to workspace number 7";
"${mod}+Shift+8" = "move container to workspace number 8";
"${mod}+Shift+9" = "move container to workspace number 9";


# Move focus
"${mod}+a" = "focus parent";

"${mod}+${cfg.down}" = "focus down";
"${mod}+${cfg.left}" = "focus left";
"${mod}+${cfg.right}" = "focus right";
"${mod}+${cfg.up}" = "focus up";

"${mod}+Left" = "focus left";
"${mod}+Down" = "focus down";
"${mod}+Up" = "focus up";
"${mod}+RIght" = "focus right";


# Move focused window
"${mod}+Shift+${cfg.down}" = "move down";
"${mod}+Shift+${cfg.left}" = "move left";
"${mod}+Shift+${cfg.right}" = "move right";
"${mod}+Shift+${cfg.up}" = "move up";

"${mod}+Shift+Left" = "move left";
"${mod}+Shift+Down" = "move down";
"${mod}+Shift+Up" = "move up";
"${mod}+Shift+Right" = "move right";


# Control window
"${mod}+Shift+q" = "kill";
"${mod}+Shift+c" = "reload";
"${mod}+Shift+space" = "floating toggle";


# App
"${mod}+Return" = "exec ${pkgs.wezterm}/bin/wezterm start --";
"${mod}+d" = "exec ${pkgs.fuzzel}/bin/fuzzel";


# Switch layout
"${mod}+s" = "layout stacking";
"${mod}+w" = "layout tabbed";


# Change window mode
"${mod}+f" = "fullscreen toggle";
"${mod}+space" = "focus mode_toggle";


# Split window
"${mod}+e" = "layout toggle split";
"${mod}+v" = "splitv";
"${mod}+b" = "splith";


# Minimalize window
"${mod}+Shift+minus" = "move scratchpad";
"${mod}+minus" = "scratchpad show";
"${mod}+Tab" = ''
swaymsg -t get_tree | jq -r '.nodes[].nodes[] | select(.name == "__i3_scratch") | .. | select(.type? == "con" and .name? != null) | "\(.id) \(.name)"' | fuzzel --dmenu --prompt='Minimalized: ' | awk '{print $1}' | xargs -I {} swaymsg '[con_id={}] scratchpad show'
'';


# Control
"${mod}+Shift+e" = "exit";


# Resize window
"${mod}+r" = "mode resize";
};


modes = let
    cfg = config.wayland.windowManager.sway.config;
    mod = cfg.modifier;
  in {
resize = {
  "Escape" = "mode default";
  "Return" = "mode default";


  "Down" = "resize grow height 10 px";
  "Left" = "resize shrink width 10 px";
  "Right" = "resize grow width 10 px";
  "Up" = "resize shrink height 10 px";

  "${cfg.left}" = "resize shrink width 10 px";
  "${cfg.down}" = "resize grow height 10 px";
  "${cfg.up}" = "resize shrink height 10 px";
  "${cfg.right}" = "resize grow width 10 px";
};
	  };
	};
      };
    }
  )];

  services.displayManager.defaultSession = "sway";
}
