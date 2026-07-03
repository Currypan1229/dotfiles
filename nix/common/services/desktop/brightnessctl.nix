{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
  
  hardware.acpilight.enable = true;
}
