{ lib, pkgs, config, ... }:

with lib; let
  drivers = [
    "amdgpu"
    "amdcpu"
  ];

  hasAmdCpu = builtins.elem "amdcpu" drivers;
  hasAmdGpu = builtins.elem "amdgpu" drivers;

  needsMesa = hasAmdGpu;

  cfg = config.drivers.amdgpu;
in {
  options.drivers.amdgpu = {
    enable = mkEnableOption "Enable AMD Drivers";
  };

  config = mkIf cfg.enable {
    # Systemd tmpfiles rules for ROCm HIP
    systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];

    # Video drivers configuration for X server
    services.xserver.videoDrivers = [ "amdgpu" ];

    # Hardware configuration based on AMD GPU presence
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = pkgs.lib.flatten (with pkgs; [
          (lib.optional hasAmdGpu amdvlk)
          (lib.optional needsMesa mesa)
        ]);
        extraPackages32 = pkgs.lib.flatten (with pkgs; [
          (lib.optional hasAmdGpu amdvlk)
          (lib.optional needsMesa mesa)
        ]);
      };

      cpu.amd.updateMicrocode = hasAmdCpu;
    };

    # Boot configuration for AMD GPU support
    boot = {
      kernelModules = [ "kvm-amd" "amdgpu" "v4l2loopback" ];
      kernelParams = [
        "amd_pstate=active"
        "tsc=unstable"
        "radeon.si_support=0"
        "amdgpu.si_support=1"
        "amdgpu.dc=1"
        "amdgpu.deep_color=1" 
      ];
      extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
      blacklistedKernelModules = [ "radeon" ];
    };

    # Power management
    powerManagement.cpuFreqGovernor = "powersave";

    # TLP for power saving
    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };
  };
}

