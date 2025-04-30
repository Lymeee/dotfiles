{ pkgs, lib, ... }:

{
  # Required for real-time scheduling (important for low-latency audio)
  security.rtkit.enable = true;

  # PipeWire configuration
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;

    # Custom PipeWire tuning for Scarlett Solo (or any USB interface)
    extraConfig.pipewire."95-scarlett-latency" = {
      "context.properties" = {
        default.clock.rate          = 48000;
        default.clock.allowed-rates = [ 48000 ];
        default.clock.quantum       = 128;
        default.clock.min-quantum   = 128;
        default.clock.max-quantum   = 256;
        default.clock.force-quantum = 128;
        default.clock.force-rate    = 48000;
      };
    };
  };

  # Disable suspend timeout for both playback and capture devices
  environment.etc."wireplumber/main.lua.d/99-no-suspend.lua".text = ''
    local rules = {
      {
        matches = {
          { { "node.name", "matches", "alsa_output.*" } },
          { { "node.name", "matches", "alsa_input.*" } },
        },
        apply_properties = {
          ["session.suspend-timeout-seconds"] = 0,
        },
      },
    }

    for _, rule in ipairs(rules) do
      table.insert(alsa_monitor.rules, rule)
    end
  '';

  # Tools for audio control and debugging
  environment.systemPackages = with pkgs; [
    pipewire
    wireplumber
    pavucontrol
    helvum
    alsa-utils
  ];
}



