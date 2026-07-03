{ ... }:

{
  services.logind.settings.Login.HandlePowerKey = "ignore";

  xdg.portal.enable = true;

  environment.pathsToLink = [ "/share/gsettings-schemas" ];  
}
