{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk25
  ];
}
