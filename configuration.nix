{ config, pkgs, inputs, ... }:
{
  imports =
    [
      ./modules
      ./hardware-configuration.nix
    ];

  # [==== PKGS ====]

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
  # <- ESSENCIALS ->
    # nano (default)
    jenkins
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
    vencord
    kitty
    obsidian
    grim                            # screenshots
    slurp                           # screenshots
    throne
       xray
	# <- FONTS ->
	jetbrains-mono
  font-awesome
  # <- CLIPBOARD ->
	wl-clipboard
	wl-clip-persist
  ];


  # [==== Programs interactions  ====]
  # programs.niri.enable = true;
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  # [==== Services ====]
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.flatpak.enable = true;
  # Downloaded version of system. Do not need to change it
  system.stateVersion = "25.05";

}
