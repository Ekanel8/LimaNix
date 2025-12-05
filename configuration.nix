{ config, pkgs, unstablepkgs,... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/virt.nix
      ./modules/wmi.nix
      ./modules/network.nix
      ./modules/bluetooth.nix
      ./modules/sddm.nix
      ./modules/thunar.nix
      ./modules/gtk.nix
      ./modules/IDE.nix
      ./modules/audio.nix
      ./modules/locales.nix
    ];

  # [==== Bootloader ====]
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features   = ["nix-command" "flakes"];

  # [==== USER ====] # P.S. Use passwd

  users.users.doc = {
    isNormalUser  = true;
    description   = "doc";
    extraGroups   = [ "networkmanager" "wheel" "storage" "plugdev" "users" "libvirt" ];
    packages      = with pkgs; [ fish ];
	  shell         = pkgs.fish;
  };

  # [==== PKGS ====]

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  # nano (default)
	tree
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
	kitty
	neovim
	openvpn
	unstablepkgs.unzip
	fastfetch
	prismlauncher
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
  # <<< Bibata >>>
	bibata-cursors
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
