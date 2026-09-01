{ pkgs, ... }:
{
  imports =
    [
      ./modules
      ./hardware-configuration.nix
    ];

  ############ PKGS ############
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
  # <- ESSENCIALS ->
    # nano (default)
    czkawka
    jmespath
    imagemagick
    cloudflared
    aircrack-ng
    kubernetes
    minikube
    nmap
    jq
    avahi
    kdePackages.filelight
    telegram-desktop
    todo
    traceroute
    keepassxc
    minicom
    thorium-reader
    tor-browser
    libtelnet
    caddy
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
  # <- CLIPBOARD ->
	wl-clipboard
	wl-clip-persist
  ];


  # [==== Programs interactions  ====]
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
