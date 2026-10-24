{
  imports =
    [
      ./bootloader.nix
      ./network.nix
      ./bluetooth.nix
      ./audio.nix
      ./locales.nix
      ./user.nix
      ./noctalia.nix
      ###################
      ./virt.nix
      ./thunar.nix
      ./IDE.nix
      ./docker.nix
    ];
}
