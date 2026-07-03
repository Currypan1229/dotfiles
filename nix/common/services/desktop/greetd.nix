{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gtkgreet
  ];

  environment.etc."greetd/environments".text = ''
    ${pkgs.sway}/bin/sway
  '';

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.coreutils}/bin/env XKB_DEFAULT_LAYOUT=jp XKB_DEFAULT_MODEL=jpoadg109a ${pkgs.cage}/bin/cage -s -- ${pkgs.gtkgreet}/bin/gtkgreet -c \"sway -d\"";
        user = "greeter";
      };
    };
  };
}
