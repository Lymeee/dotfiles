{ config, pkgs, lib, ... }:

{
  services.displayManager = {
    defaultSession = "hyprland";

    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "sddm-astronaut-theme";
      package = lib.mkForce pkgs.kdePackages.sddm;
      extraPackages = [ pkgs.sddm-astronaut ];

      settings = {
        General = {
          InputMethod = "";
        };

        Theme = {
          Current = "sddm-astronaut-theme";
        };

        sddm-astronaut-theme = {
          ThemeFile = "Themes/japanese_aesthetic.conf";
        };
      };
    };
  };

  environment.etc."sddm/themes/sddm-astronaut-theme/Backgrounds/japanese_aesthetic.png".source =
    "/home/lymee/images/misc/mikulock.jpg";

}


