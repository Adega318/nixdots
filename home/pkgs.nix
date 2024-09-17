{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Apps
    discord
    betterdiscordctl
    vscode
    nautilus
    teams-for-linux
    obsidian
    blender
    dia

    # Games
    lutris
    ryujinx

    #	Programing
    python3
    openjdk
    rustc
    rustup
    gcc
    maven
    lazydocker

    # Mix
    pavucontrol
    swww
    pamixer
    zip
    unzip
    tree
    blueman
    wget
    brightnessctl
    networkmanagerapplet
    neofetch
    pfetch

    # Compositor
    xwayland
    xclip
    wl-clipboard
    cliphist
  ];
}
