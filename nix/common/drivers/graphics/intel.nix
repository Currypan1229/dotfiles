{ pkgs, lib, ... }:

let
  hasIntelGPU = lib.elem "i915" config.boot.initrd.availableKernelModules 
                 || lib.elem "i915" config.boot.kernelModules
                 || config.hardware.cpu.intel.updateMicrocode;
  hasNvidiaGPU = lib.elem "nvidia" config.services.xserver.videoDrivers;

in
{
  config = lib.mkIf hasIntelGPU {
    # Disable Panel Self Refresh to prevent screen flickering
    boot.kernelParams = [ "i915.enable_psr=0" ];

    # Enable Hardware Acceleration for Intel GPUs
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        libvdpau-va-gl
      ];
    };

    environment.sessionVariables = lib.mkIf (!hasNvidiaGPU) {
      LIBVA_DRIVER_NAME = "iHD";
      VDPAU_DRIVER = "va_gl";
    };

    # Install Intel GPU utils
    environment.systemPackages = with pkgs; [
      intel-gpu-tools
    ];
  };
}
