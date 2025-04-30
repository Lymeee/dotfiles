{ config, pkgs, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;    
    dedicatedServer.openFirewall = true; 
  };

  hardware.graphics.enable = true;


  # Ensure Vulkan 
  hardware.graphics.extraPackages = with pkgs; [
    vulkan-loader
    vulkan-tools
    vulkan-headers
    vulkan-validation-layers
  ];

  # Add Steam and compatibility packages to system packages
  environment.systemPackages = with pkgs; [
    steam
    steam-run  
    gamemode  
    mangohud 
    protonup-qt
  ];
}

