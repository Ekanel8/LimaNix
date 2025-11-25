{ config, pkgs, unstablepkgs,... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/virt.nix
      ./modules/wmi.nix
      ./modules/ttl.nix
      ./modules/bluetooth.nix
      ./modules/sddm.nix
      ./modules/thunar.nix
      ./modules/gtk.nix
      ./modules/IDE.nix
      ./modules/audio.nix
    ];

  # [==== Bootloader ====]

  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features   = ["nix-command" "flakes"];

  # [==== Networks ====]

  networking.hostName                  = "jarvis";         # Define your hostname.
  networking.firewall.enable           = true;             # Basic firewall
  networking.networkmanager.enable     = true;             # Enable networking
  networking.networkmanager.settings = {
    connection = {
      autoconnect = "true";
      autoconnect-retries = "-1";
      autoconnect-retries-interval = "1";
      };
  };

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
  # <<< fonts >>>
	jetbrains-mono
  # <<< Basic system pack >>>
  # nano (default)
	tree
	vim
	feh
	pass-wayland
	wget
	git
	firefox
	wev
	tcpdump
	ffmpeg
	htop
	font-awesome
	killall
	tlp #batary
	acpi
	usbutils
	acpica-tools
	kitty
	neovim
	openvpn
	unzip
	fastfetch
	prismlauncher
	unstablepkgs.obsidian
	brightnessctl
	nix-output-monitor
	grim                            # screenshots
	slurp                           # screenshots
  # <<< Clipboard >>>
	wl-clipboard
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

  services.openssh = {
	enable = true;                         # Enable the OpenSSH daemon.
	# settings = {
	#	 PermitRootLogin = "yes";
	#};
  };

  # [==== Locales ====]

  time.timeZone = "Europe/Moscow";                        # Set your time zone.
  i18n.defaultLocale = "en_US.UTF-8";                     # Select internationalisation properties.

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  system.stateVersion = "25.05";

}
