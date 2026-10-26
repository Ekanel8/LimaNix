{ pkgs, inputs, config, ... }:
let
  stablePkgs = import inputs.nixpkgs-stable {
    system = pkgs.system;
    config = config.nixpkgs.config; # Важно: переносим конфиг (allowUnfree и т.д.)
  };
in
{
  imports =
    [
      ./modules
      ./hardware-configuration.nix
    ];

  ############ PKGS ############
  nixpkgs.overlays = [
      (final: prev: {
        obsidian = stablePkgs.obsidian;
      })
    ];
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
  # <- ESSENCIALS ->
    # nano (default)
    qimgv
    clapper
    seahorse
    smartmontools
    unoconv
    cloud-init
    dmidecode
    fortune
    wireshark
    czkawka
    jmespath
    imagemagick
    kubernetes
    minikube
    kdePackages.filelight
    todo
    traceroute
    keepassxc
    minicom
    thorium-reader
    tor-browser
    opentofu
    remmina
    dnsutils
    getent
    nodejs
    herdr
    opencode
    easyeffects
    packer
    terraform
    ansible
    git
    tree
    bash
    vim
    htop
    wget
    killall
    firefox
  # <- SYS-UTILS ->
    wev
    tcpdump
    ffmpeg
    tlp
    acpi
    usbutils
    acpica-tools
    unzip
    brightnessctl
  # <- USER ->
    nil
    nixd
    package-version-server
    discord
    kitty
    obsidian
    grim
    slurp
    xray #core for throne
	# <- FONTS ->
	jetbrains-mono
  font-awesome
  nerd-fonts.jetbrains-mono
  bibata-cursors
  # <- CLIPBOARD ->
	wl-clipboard
	wl-clip-persist
  ];

  # [==== Programs interactions  ====]
  security.pam.services.login.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
  programs.gpu-screen-recorder.enable = true;
  # [==== Services ====]
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.flatpak.enable = true;
  # Don't change
  system.stateVersion = "25.05";

}
