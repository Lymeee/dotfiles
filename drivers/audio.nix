{ pkgs, lib, ... }:

{
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;

    wireplumber.configPackages = [
      (pkgs.stdenv.mkDerivation {
        pname = "wireplumber-nosuspend";
        version = "1.0";

        src = pkgs.writeTextDir "main.lua.d/90-disable-suspend.lua" ''
          table.insert (policy.rules, {
            matches = {
              {
                { "node.name", "matches", "alsa_input.usb-Focusrite_Scarlett_Solo_4th_Gen_*" }
              },
              {
                { "node.name", "matches", "alsa_input.usb-Generic_USB_Audio*" }
              }
            },
            apply_properties = {
              ["session.suspend-timeout-seconds"] = 0,
            }
          })
        '';

        installPhase = ''
          mkdir -p $out/share/wireplumber/main.lua.d
          cp -r main.lua.d/* $out/share/wireplumber/main.lua.d/
        '';
      })
    ];

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

  environment.sessionVariables.PULSE_LATENCY_MSEC = "30";

  environment.systemPackages = with pkgs; [
    pipewire
    wireplumber
    pavucontrol
    helvum
    alsa-utils
  ];
}







