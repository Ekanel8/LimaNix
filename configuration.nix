{ config, pkgs, unstablepkgs,... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/virt.nix
      ./modules/wmi.nix
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
    extraGroups   = [ "networkmanager" "wheel" "storage" "plugdev" "users" ];
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
	wget
	git
	firefox
	wev
	htop
	tlp #batary
	acpi
	usbutils
	acpica-tools
	kitty
	openvpn
	unzip
	zed-editor
	fastfetch
	unstablepkgs.obsidian
  waybar
  unstablepkgs.quickshell
	brightnessctl
	grim                            # screenshots
	slurp                           # screenshots
	wofi
	libsForQt5.qtgraphicaleffects   # for sddm themes
	where-is-my-sddm-theme          # sddm theme
  # <<< Clipboard >>>
	wl-clipboard
  # <<< Bibata >>>
	bibata-cursors
  # <<< Hyprfamily >>>
	hyprpaper
	hypridle
	hyprlock
  # <<< IDE >>>
  gnumake
  jetbrains.goland
  unstablepkgs.go
  jetbrains.clion
  gcc # C++ compiler
  #binutils redmidrivers
  #dkms  #redmidrivers
  unstablepkgs.cmake # CMake
  jetbrains.pycharm-professional
  python314
  gtk4
  gtk3
  papirus-icon-theme
  graphite-gtk-theme
  ];

  # [==== Programs interactions  ====]

  programs.thunar.enable = true;               # file manager
  programs.thunar.plugins = with pkgs.xfce; [
   thunar-volman                               # automount addon
   thunar-archive-plugin                       # archive   addon
  ];

  programs.hyprland.enable = true;
  programs.fish.enable = true;

  # [==== Services ====]
  services.superduperdriverpack.wmi.enable = true;
  services.gvfs.enable = true;                            # thunar-volman req. allows see the drives
  services.udisks2.enable = true;                         # thunar-volman req. allows usb disks
  security.polkit.enable = true;                          # thunar-volman req. allow mount without root
  services.tumbler.enable = true;
  services.displayManager.sddm = {
	enable = true;
	wayland.enable = true;
	theme = "${pkgs.where-is-my-sddm-theme.override { variants = [ "qt5" ]; }}/share/sddm/themes/where_is_my_sddm_theme_qt5";
};

  services.openssh = {
	enable = true;                         # Enable the OpenSSH daemon.
	settings = {
		PermitRootLogin = "yes";           # DELETE IT !!!!!!!!!!!!
	};
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

  # [==== X11 key map ====]

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  system.stateVersion = "25.05";

}

# Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
