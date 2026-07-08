{ config, pkgs, inputs, ... }:
{
  imports =
    [
      ./modules
      ./hardware-configuration.nix
    ];
    networking.extraHosts = ''
      172.16.100.100 nexus.d-t.by
      172.16.100.100 openproject.d-t.by
    '';
    networking.wireguard.enable = true;
  # [==== PKGS ====]

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
  # <- ESSENCIALS ->
    # nano (default)
    opentofu
    remmina
    dnsutils
    getent
    nodejs
    python313Packages.pywinrm
    herdr
    opencode
    gpu-screen-recorder
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
  services.upower.enable = true;
  services.flatpak.enable = true;
  # Downloaded version of system. Do not need to change it
  system.stateVersion = "25.05";

}
