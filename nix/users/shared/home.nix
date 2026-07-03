{ pkgs, ... }:

{
  home-manager.sharedModules = [(
    { ... }:
    {
      home = {
        sessionVariables = {
          EDITOR = "nvim";
        };

        stateVersion = "26.05";
      };

      wayland.windowManager.sway.config.input."type:keyboard" = {
        xkb_layout = "jp";
        xkb_model = "jp106";
      };
    }
  )];
}
