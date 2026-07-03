{ pkgs, ... }:

{
  # Realtime priority for processes
  security.rtkit.enable = true;
}
