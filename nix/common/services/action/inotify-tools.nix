{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inotify-tools
  ];
}
