{
  description = "System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ nixpkgs, home-manager, stylix, nixvim, ... }:
    let
      system = "x86_64-linux";
      settings = {
        hostName = "LaNxAd";
        userName = "adega";
        email = "eadegafernandez@gmail.com";
        wallpaper = ./wallpapers/mountain.png;
      };
    in
    {
      nixosConfigurations.${settings.hostName} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit settings; };
        modules =
          [ ./nixos/configuration.nix inputs.stylix.nixosModules.stylix ];
      };

      homeConfigurations.${settings.userName} =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit settings; };
          modules = [
            ./home/home.nix
            nixvim.homeManagerModules.nixvim
            stylix.homeManagerModules.stylix
          ];
        };
    };
}
