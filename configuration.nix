{ pkgs, ... }:
{
  imports =
    [
      ./modules
      ./hardware-configuration.nix
    ];

  ############ PKGS ############
  programs.throne = #DELETE IT AFTER MERGE
    let
      pkgs-from-pr = import (fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/0cbdc25b4df6051689052125cb550485f09dfb59.tar.gz";
        sha256 = "sha256:1791gf9cnsfkcfv2dg15yb4y5yb8nj8lzavm3j7a0c7x7h22cq35";
      }) { inherit (pkgs.stdenv.hostPlatform) system; };
    in
    {
      enable = true;
      package = pkgs-from-pr.throne;
      # tunMode.enable = true;
    };
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
    #throne
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
