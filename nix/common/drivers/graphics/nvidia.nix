{ config, pkgs, lib, ... }:

let
  hasNvidiaGPU = lib.elem "nvidia" config.services.xserver.videoDrivers;

in
{
  config = lib.mkIf hasNvidiaGPU {
    # Enable the NVIDIA driver
    #services.xserver.videoDrivers = [ "nvidia" ];

    # Setup NVIDIA GPU
    hardware.nvidia = {
      modesetting.enable = true;

      # Use the NVidia open source kernel module
      open = false;

      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      powerManagement = {
        # Nvidia power management.
        # Enable this if you have graphical corruption after suspend/wake.
        enable = true;

        # Turns off GPU when not in use. (Turing or newer).
        finegrained = true;
      };

      # PRIME CONFIGURATION (Hybrid Graphics)
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };

    # Enable Hardware Acceleration for NVIDIA GPUs
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vaapi-vdpau
        nvidia-vaapi-driver
      ];
    };

    # Switch to the NVIDIA GBM backend
    environment.sessionVariables = {
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NVD_BACKEND = "direct";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      LIBVA_DRIVER_NAME = "nvidia";
    };

    # Install NVIDIA GPU utils
    environment.systemPackages = with pkgs; [
      nvtopPackages.nvidia
    ];
  };
}
