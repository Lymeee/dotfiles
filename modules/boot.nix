{ config, pkgs, lib, ... }:

{
  # Use the latest available XanMod kernel (non-LTS)
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  # Kernel parameters optimized for Zen 5 performance
  boot.kernelParams = [
    "quiet"
    "nowatchdog"
    "amd_pstate=guided"         # Recommended governor for Zen 5 CPUs
    "mitigations=off"           # Disable CPU security mitigations for performance
    "usbcore.autosuspend=-1"    # Prevent USB devices from suspending automatically
  ];

  # Load custom kernel modules
  boot.kernelModules = [ "nct6775" ];

  # Set options for specific kernel modules
  boot.extraModprobeConfig = ''
    options nct6775 force_id=0x290
  '';

  # Bootloader configuration for UEFI systems
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable SysRq key for safe reboot and recovery shortcuts
  boot.kernel.sysctl."kernel.sysrq" = 1;

  # Reserve HugePages (used for Wine/Proton, emulators, and some games)
  boot.kernel.sysctl."vm.nr_hugepages" = 128;

  # Enable earlyoom to avoid full system lockups under memory pressure
  services.earlyoom.enable = true;

  # Optional: Enable systemd-oomd instead or alongside earlyoom
  # systemd.oomd.enable = true;
}

