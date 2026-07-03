{ pkgs, ... }:

{
  home-manager.users.user1 = {
    home = {
      # Personal packages
      packages = with pkgs; [
        gnumake
        luarocks
        lua
        gcc
        nodejs
      ];

      # symlinks
      file = {
        # zshrc
        #".zshrc".source = ../../../.zshrc;

        # neovim
        ".config/nvim".source = ../../../nvim;

        # sway
        #".config/sway".source = ../../../sway;

        # waybar
        #".config/waybar".source = ../../../waybar;

        # wezterm
        ".config/wezterm".source = ../../../wezterm;
      };

      sessionVariables = {
        EDITOR = "nvim";
      };

      stateVersion = "26.05";
    };
  };
}
