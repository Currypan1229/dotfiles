{ pkgs, ... }:

{
  # Fonts
  fonts = {
    packages = with pkgs; [
      udev-gothic-nf
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ]; 

    fontconfig = {
      enable = true;
      hinting.style = "slight";
      subpixel.rgba = "rgb";
    };
  };
  
  boot = {
    plymouth = {
      enable = false;
      theme = "simple";
      themePackages = [
        (pkgs.stdenv.mkDerivation {
          pname = "plymouth-theme-simple";
          version = "1.0";

          # CHANGE THIS to the actual path of your custom theme folder
          src = /etc/nixos/config/programs/plymouth/simple;

          installPhase = ''
            mkdir -p $out/share/plymouth/themes/simple
            cp -r * $out/share/plymouth/themes/simple/

            # This dynamically replaces the @out@ placeholder with the real Nix store path
            substituteInPlace $out/share/plymouth/themes/simple/simple.plymouth \
              --replace "@out@" "$out"
          '';
        })
      ];
    };
  };
}
