{ config, pkgs, inputs, ... }:
{
  services.getty.autologinUser = "doc";
  environment.loginShellInit = ''
    if [ "$(tty)" = "/dev/tty1" ];
    then
    exec start-hyprland
    fi
  '';
  # ===============BE AWARE==================
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features   = ["nix-command" "flakes"];
  boot.kernelModules = [ ];
}
