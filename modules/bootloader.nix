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
  boot.kernelParams = [
      "amd_pstate=passive"
      "amd_pstate.shared_mem=1"
      "initcall_blacklist=acpi_cpufreq_init"
      "pcie_aspm=force"
      "module_blacklist=ucsi_acpi"
      "preempt=voluntary"
      "nowatchdog"
  ];
}
