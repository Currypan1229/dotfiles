{ pkgs, ... }:

{
  xdg.portal = {
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
