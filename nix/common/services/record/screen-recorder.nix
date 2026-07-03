{ pkgs, ... }:

{
  # Imports
  imports =
    [
    ];
  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
  ];
}
