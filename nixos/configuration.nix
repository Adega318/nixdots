{ pkgs, settings, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      version = 2;
      efiSupport = true;
      device = "nodev";
    };
  };

  networking.hostName = settings.hostName;

  # Enable networking
  networking.networkmanager.enable = true;

  # Power
  services.thermald.enable = true;
  services.power-profiles-daemon.enable = true;
  powerManagement.powertop.enable = true;

  # OpenGL
  hardware.graphics.enable = true;

  # USB
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "es";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # terminal
  programs.zsh.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # user
  users.users.${settings.userName} = {
    isNormalUser = true;
    description = "${settings.userName}";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    vim
    neovim
    git
    wget
  ];

  system.stateVersion = "24.05";
}
