{ ... }:

{
  home-manager.sharedModules = [(
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        oh-my-posh
      ];
   }
  )];
}
