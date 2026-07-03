{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    power-profiles-daemon
  ];

  # Power Management Services
  services.power-profiles-daemon.enable = true;
}
