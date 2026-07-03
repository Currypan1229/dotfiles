{ ... }:

{
   # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  environment.sessionVariables = {
    GTK_IM_MODULE   = "fcitx5";
    QT_IM_MODULE    = "fcitx5";
    INPUT_METHOD    = "fcitx5";
    SDL_IM_MODULE   = "fcitx5";
    GLFW_IM_MODULE  = "ibus";
  };

  services.xserver.desktopManager.runXdgAutostartIfNone = true;
}
