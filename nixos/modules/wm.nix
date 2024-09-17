{
  services = {
    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      xkb = {
        layout = "es";
        variant = "";
      };
    };
  };

  # Hyperland
  programs.hyprland.enable = true;
}
