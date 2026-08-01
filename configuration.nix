{ config, pkgs, inputs, ... }:
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
    code-cursor
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
    tlp #batary
    acpi
    usbutils
    acpica-tools
    unzip
    brightnessctl
  # <- USER ->
    discord
    kitty
    obsidian
    grim                            # screenshots
    slurp                           # screenshots
    throne
       xray
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
  # [==== Services ====]
  services.power-profiles-daemon.enable = true;
  programs.gpu-screen-recorder.enable = true;
  services.upower.enable = true;
  services.flatpak.enable = true;
  # Downloaded version of system. Do not need to change it
  system.stateVersion = "25.05";

}
