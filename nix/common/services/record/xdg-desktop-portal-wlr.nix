{ pkgs, ... }:

{
  xdg.portal = {
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };
}
