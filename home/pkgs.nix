{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Apps
    firefox
    opera
    chromium
    discord
    betterdiscordctl
    vscode
    nautilus
    teams-for-linux
    obsidian
    blender
    dia
    korganizer

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
    ledit

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
