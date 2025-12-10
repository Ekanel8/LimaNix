{ config, pkgs, unstablepkgs, ... }:
{
  services.getty.autologinUser = "doc";
  environment.loginShellInit = ''
    if [ "$(tty)" = "/dev/tty1" ];
    then
    exec hyprland
    fi
  '';
  # ===============BE AWARE==================
  boot.kernelPackages = pkgs.linuxPackages_6_18;
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features   = ["nix-command" "flakes"];
}
