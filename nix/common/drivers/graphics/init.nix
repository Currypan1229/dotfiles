{ lib, pkgs, ... }:

{
  # Imports
  imports =
    [
      ./intel.nix
      ./nvidia.nix
    ];
    
  # Configure Wayland for graphics applications
  environment.sessionVariables = {
    GDK_BACKEND = lib.mkOverride 999 "wayland";
    QT_QPA_PLATFORM = "wayland;xcb";
    MOZ_ENABLE_WAYLAND = "1";
  };

  # Install graphics utils
  environment.systemPackages = with pkgs; [
    mesa-demos
    libva-utils
  ];
}
