{ pkgs, settings, ... }: {
  environment.systemPackages = [
    pkgs.wayland
    pkgs.wl-clipboard
  ];

  services = {
    xserver = {
      enable = true;
      displayManager.lightdm = {
        enable = true;
        background = settings.wallpaper;
        greeter.enable = true;
        greeters.slick.enable = true;
      };
      xkb = {
        layout = "es";
        variant = "";
      };
    };
  };

  # Hyperland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      hyprland.default = [ "hyprland" ];
    };
  };
}
