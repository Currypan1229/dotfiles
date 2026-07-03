{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clock-rs
  ];
}
