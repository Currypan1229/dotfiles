{ pkgs, ... }:

{
  console.useXkbConfig = true;

  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";

      fcitx5 = {
        addons = with pkgs; [
          fcitx5-mozc
          fcitx5-gtk
        ];

	waylandFrontend = true;

	settings = {
          globalOptions = {
            "Hotkey/TriggerKeys" = {
              "0" = "Zenkaku_Hankaku";
              "1" = "Hangul_Hanja";
            };
          };	
	  inputMethod = {
	    "Groups/0" = {
	      Name = "Default";
              "Default Layout" = "jp";

              "Items/0" = "keyboard-jp";
              "Items/1" = "mozc";
	    };
	  };
	};
      };
    };
  };
}
