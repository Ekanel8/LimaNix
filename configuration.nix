{ config, pkgs, unstablepkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/bootloader.nix
      ./modules/wmi.nix
      ./modules/network.nix
      ./modules/bluetooth.nix
      #./modules/sddm.nix
      ./modules/audio.nix
      ./modules/locales.nix
      ./modules/user.nix
      #============^^^=============
      #./modules/virt.nix
      ./modules/thunar.nix
      ./modules/gtk.nix
      ./modules/IDE.nix
      #./modules/pkgs.nix
    ];

  # [==== PKGS ====]

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  # nano (default)
	tree
	bash
	vim
  cava
	file-roller                                 # unzipper
	feh
	pass-wayland
	wget
	git
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
	openvpn
	unstablepkgs.unzip
	fastfetch
	unstablepkgs.prismlauncher
	unstablepkgs.obsidian
	brightnessctl
	nix-output-monitor
	jetbrains-mono
  font-awesome
	grim                            # screenshots
	slurp                           # screenshots
  # <<< Clipboard >>>
	wl-clipboard
	wl-clip-persist
  ];

  # [==== Programs interactions  ====]
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  # [==== Services ====]
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.superduperdriverpack.wmi.enable = true;

  system.stateVersion = "25.05";

}
