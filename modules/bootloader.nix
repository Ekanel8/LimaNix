{ config, pkgs, unstablepkgs, ... }:
{
  # ===============BE AWARE==================
  boot.kernelPackages = pkgs.linuxPackages_6_18;
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features   = ["nix-command" "flakes"];
}
