{ pkgs, ... }:

{
  home-manager.sharedModules = [(
    { ... }:
    {
      programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            fields = "name,generic,comment,executable,keywords";
          };
        };
      };
    }
  )];
}

