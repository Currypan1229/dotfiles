{ ... }:

{
  home-manager.sharedModules = [(
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        onlyoffice-desktopeditors
      ];
   }
  )];
}
