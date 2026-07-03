{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    font-awesome
  ];
}
