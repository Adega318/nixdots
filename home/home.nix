{ pkgs, settings, ... }:

{
  imports = [ ./modules ./pkgs.nix ../nixos/modules/stylix.nix ];

  programs.home-manager.enable = true;
  home = {
    username = settings.userName;
    homeDirectory = "/home/${settings.userName}";
    stateVersion = "24.05";

    packages = [
      (import ../scripts/wofi-sesion.nix { inherit pkgs; })
      (import ../scripts/wofi-powerctl.nix { inherit pkgs; })
    ];
  };

  nixpkgs.config.allowUnfree = true;
}
