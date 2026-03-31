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
  # nano (default)
  git
  v2rayn
	tree
	bash
	vim
  cava
	file-roller                                 # unzipper
	feh
	pass-wayland
	wget
	firefox
	wev
	tcpdump
	ffmpeg
	htop
	killall
	tlp #batary
	acpi
	usbutils
	acpica-tools
	discord
	vencord
	kitty
	neovim
	xray
	openvpn
	unzip
	fastfetch
	obsidian
	brightnessctl
	jetbrains-mono
  font-awesome
	grim                            # screenshots
	slurp                           # screenshots
	alacritty
  # <<< Clipboard >>>
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
