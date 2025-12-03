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
      ./modules/locales.nix
    ];

  # [==== Bootloader ====]
  boot.kernelParams = [
    "amdgpu.sg_display=0"
  ]; # redmibook only
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
	file-roller # thunar unzipper
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
	unstablepkgs.unzip
	fastfetch
	prismlauncher
	unstablepkgs.obsidian
	brightnessctl
	nix-output-monitor
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

  services.openssh = {
	enable = true;                         # Enable the OpenSSH daemon.
	# settings = {
	#	 PermitRootLogin = "yes";
	#};
  };

  system.stateVersion = "25.05";

}
