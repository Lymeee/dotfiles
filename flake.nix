{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    miku-theme = {
      url = "path:./themes/miku";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, hyprpanel, spicetify-nix, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      miku-theme = builtins.path {
        name = "spicetify-miku";
        path = ./themes/miku;
      };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };

            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;

            home-manager.users.lymee = import ./home.nix;

            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [ hyprpanel.overlay ];
          }
        ];
      };

      homeManagerModules.spicetify = spicetify-nix.homeManagerModules.spicetify;

      packages.${system}.miku-theme = miku-theme;

      apps.${system}.spotify = {
        type = "app";
        program = "${pkgs.writeShellScriptBin "spotify" ''
          exec ${pkgs.lib.getBin pkgs.spotify}/bin/spotify
        ''}/bin/spotify";
      };
    };
}
