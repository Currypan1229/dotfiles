{ ... }:

{
  # Imports
  imports = [
    <home-manager/nixos>
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "backup";
  };
}
