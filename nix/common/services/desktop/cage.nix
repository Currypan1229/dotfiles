{ pkgs, ... }:

{
  services.cage = {
    enable = true;
    user = "kiosk";
  };

  users.users.kiosk = {
    isNormalUser = true;
    extraGroups = [ "video" "audio" ];
  };
}
