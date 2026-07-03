{ pkgs, ... }:

{
  boot = {
    consoleLogLevel = 6;
    initrd.verbose = false;
    kernelParams = [
      "boot.shell_on_fail"
      "loglevel=6"
      "rd.systemd.show_status=true"
      "rd.udev.log_level=4"
      "udev.log_priority=4"
      "tsc=reliable"
    ];
    
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Kernel Packages and Optimization
    kernelPackages = pkgs.linuxPackages_latest;

    kernelModules = [ "tcp_bbr" ];
    kernel.sysctl = {
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "fq";
      "net.core.wmem_max" = 1073741824;
      "net.core.rmem_max" = 1073741824;
      "net.ipv4.tcp_rmem" = "4096 87380 1073741824";
      "net.ipv4.tcp_wmem" = "4096 87380 1073741824";
    };
  };

  # Nix settings and maintenance
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "26.05";
}
