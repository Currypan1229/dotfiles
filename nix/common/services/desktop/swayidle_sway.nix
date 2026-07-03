{ lib, ... }:

{
  wayland.windowManager.sway.systemd.enable = lib.mkForce true;
}

