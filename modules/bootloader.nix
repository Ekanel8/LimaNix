{ lib, pkgs, ... }:
let
  tuigreeter = pkgs.writeShellScript "tuigreet-greet" ''
    GREETING=$(${lib.getExe pkgs.fortune})
    exec ${lib.getExe pkgs.tuigreet} \
      --greeting "$GREETING" \
      --cmd "start-hyprland > /dev/null 2>&1" \
  '';
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "greeter";
        command = "${tuigreeter}";
      };
    };
  };

  # ===============BE AWARE==================
  # Loading
  boot = {
     consoleLogLevel = 3;
     loader.timeout = 3;
     initrd.verbose = false;
   };
  # kernel verison
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot type
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # flake enable
  nix.settings.experimental-features   = ["nix-command" "flakes"];
  boot.kernelModules = [ ];
  boot.kernelParams = [
      # optimizations
      "amd_pstate=passive"
      "amd_pstate.shared_mem=1"
      "initcall_blacklist=acpi_cpufreq_init"
      "pcie_aspm=force"
      "module_blacklist=ucsi_acpi"
      "preempt=voluntary"
      "nowatchdog"
      # quite
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
  ];

  # hibernation
  # swapDevices = [
  #   { device = "/dev/nvme0n1p5"; }
  # ];
  # boot.resumeDevice = "/dev/nvme0n1p5";
}
