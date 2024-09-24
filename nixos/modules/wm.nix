{
  services = {
    xserver = {
      enable = true;
      displayManager.startx = {
        enable = true;
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
