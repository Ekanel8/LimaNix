{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ ];
  boot.kernelParams = [
      "amd_pstate=passive"
      "amd_pstate.shared_mem=1"
      "initcall_blacklist=acpi_cpufreq_init"
      "pcie_aspm=force"
      "module_blacklist=ucsi_acpi"
      "preempt=voluntary"
      "nowatchdog"
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
  ];
  boot = {
     consoleLogLevel = 3;
     loader.timeout = 3;
   };

  # hibernation
  # swapDevices = [
  #   { device = "/dev/nvme0n1p5"; }
  # ];
  # boot.resumeDevice = "/dev/nvme0n1p5";
}
