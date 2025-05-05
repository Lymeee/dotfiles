{ config, pkgs, lib, ... }:

let
  tuigreetCfg = pkgs.writeText "tuigreet-config.toml" ''
    [theme]
    background = "#373b3e"         # charcoal
    foreground = "#bec8d1"         # light gray
    cursor     = "#86cecb"         # teal
    selection_background = "#137a7f"  # dark teal
    selection_foreground = "#ffffff" # white

    border    = "#86cecb"
    highlight = "#e12885"          # pink
    prompt    = "#8bd5ca"          # bright teal
    error     = "#e12885"
  '';
in {
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --user-menu --cmd Hyprland --theme ${tuigreetCfg}";
        user = "greeter";
      };
    };
  };

  users.users.greeter = {
    isSystemUser = true;
    description = "Greetd login user";
    home = "/var/lib/greetd";
    shell = pkgs.bashInteractive;
    group = "greeter";
  };

  users.groups.greeter = { };

  services.seatd.enable = true;

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
    bashInteractive
  ];

  security.pam.services.greetd.enableGnomeKeyring = true;
}

