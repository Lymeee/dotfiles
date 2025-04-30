{ pkgs, inputs, ... }:

let
  miku = {
    background = "#373b3e";  # charcoal
    text       = "#bec8d1";  # light gray
    highlight  = "#86cecb";  # teal
    hover      = "#e12885";  # pink
    border     = "#137a7f";  # dark teal
    accent     = "#8bd5ca";  # bright teal
  };

  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    enable = true;

    spotifyPackage = spicePkgs.spotify;
    spicetifyPackage = spicePkgs.spicetify;

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];

    theme = {
      name = "miku";
      src = inputs.self.packages.${pkgs.system}.miku-theme;

      injectCss = true;
      injectThemeJs = true;
      replaceColors = true;

      customColorScheme = {
        text              = miku.text;
        subtext           = miku.accent;
        sidebar-text      = miku.text;
        main              = miku.background;
        sidebar           = miku.background;
        player            = miku.background;
        card              = miku.border;
        shadow            = miku.background;
        selected-row      = miku.highlight;
        button            = miku.accent;
        button-active     = miku.hover;
        button-disabled   = miku.border;
        tab-active        = miku.highlight;
        notification      = miku.hover;
        notification-error= miku.hover;
        misc              = miku.text;
      };
    };

    colorScheme = "Base";
  };
}

