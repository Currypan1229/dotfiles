{ lib, ... }:

{
  # Imports
  imports =
    [
      ./users/init.nix
      ./common/init.nix
      ./unique/init.nix
    ];

    environment.defaultPackages = lib.mkForce [];
}
