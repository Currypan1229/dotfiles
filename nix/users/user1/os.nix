{ pkgs, ... }:

{
  users.users.user1 = {
    isNormalUser = true;
    description = "user1";
    extraGroups = [ "networkmanager" "wheel" "video" "adbusers" "libvirtd"]; 
    packages = with pkgs; [
    ];
    useDefaultShell = true;
  };

  security.sudo.extraRules = [
    {
      users = [ "user1" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}

