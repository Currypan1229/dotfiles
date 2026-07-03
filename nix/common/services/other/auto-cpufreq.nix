{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    auto-cpufreq
  ];

  # Power Management Services
  services.auto-cpufreq = {
    settings = {
      charger = {
        governor = "performance";
	turbo = "auto";
      };

      battery = {
        governor = "powersave";
	turbo = "never";
	energy_performance_preference = "power";
      };
    };
  };
}
