{ pkgs, ... }:

{
  # Imports
  imports =
    [
      ./android-tools.nix
      ./ffmpeg.nix
      ./file.nix
      ./fzf.nix
      ./inotify-tools.nix
      ./killall.nix
      ./p7zip.nix
      ./playerctl.nix
      ./ripgrep.nix
      ./wget.nix
      ./yq-go.nix
    ];
}
