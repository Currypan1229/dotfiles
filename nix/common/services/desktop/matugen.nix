{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    matugen
  ];
}
