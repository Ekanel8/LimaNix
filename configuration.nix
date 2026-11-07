{ pkgs, ... }:
{
  ############ PKGS ############
  environment.systemPackages = with pkgs; [
    # nano (default)
    openssl
    qimgv
    clapper
    seahorse
    smartmontools
    unoconv
    cloud-init
    dmidecode
    fortune
    wireshark
    czkawka
    jmespath
    imagemagick
    kubernetes
    minikube
    kdePackages.filelight
    todo
    traceroute
    keepassxc
    minicom
    thorium-reader
    tor-browser
    opentofu
    remmina
    dnsutils
    getent
    herdr
    easyeffects
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
    wev
    tcpdump
    ffmpeg
    tlp
    acpi
    usbutils
    acpica-tools
    unzip
    brightnessctl
    nil
    nixd
    package-version-server
    discord
    kitty
    obsidian
    grim
    slurp
    xray
    jetbrains-mono
    font-awesome
    nerd-fonts.jetbrains-mono
    bibata-cursors
    wl-clipboard
    wl-clip-persist
    gnumake
    docker-compose
    go
    gcc
    ninja
    cmake
    python315
    zed-editor
    curlpp
    vscode
  ];

  ############ Systemd ############
  services.gnome.gnome-keyring.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.flatpak.enable = true;

  ############ Security ############
  security.pam.services.login.enableGnomeKeyring = true;

  ############ Interactions ############
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  programs.throne = { enable = true; tunMode.enable = true; };
  programs.gpu-screen-recorder.enable = true;
  virtualisation.docker = { enable = true; enableOnBoot = false; };

  ############ Environment ############
  environment.variables = {
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  ############ System (Do not change) ############
  nix.settings.experimental-features   = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
  services.logind.settings.Login.HandlePowerKey = "ignore";
  imports =
  [
    ./modules
    ./hardware-configuration.nix
  ];
}
