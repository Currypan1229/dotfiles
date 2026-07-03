{ ... }:

{
  home-manager.sharedModules = [(
    { ... }:
    {
      programs.wezterm.enable = true;
   }
  )];
}
