{ config, pkgs, lib, ... }:

let
  cfg = config.services.superduperdriverpack.wmi;

  wmiDrv = pkgs.stdenv.mkDerivation rec {
    pname = "redmibook_wmi";
    version = "1.0";

    src = pkgs.fetchFromGitHub {
      owner = "vrolife";
      repo = "modern_laptop";
      rev = "main";
      sha256 = "sha256-JZmHiJxvORCz1cWFHha7GkJRYnf8P6y8U2OUHEmJw0k=";
    };

    buildInputs = [ pkgs.linuxPackages_6_12.kernel.dev ];

    buildPhase = ''
      make -C ${pkgs.linuxPackages_6_12.kernel.dev}/lib/modules/${pkgs.linuxPackages_6_12.kernel.modDirVersion}/build \
        M=$PWD/drivers/redmibook_wmi modules
    '';

    installPhase = ''
      mkdir -p $out/lib/modules/${pkgs.linuxPackages_6_12.kernel.modDirVersion}/extra
      cp drivers/redmibook_wmi/redmibook_wmi.ko \
         $out/lib/modules/${pkgs.linuxPackages_6_12.kernel.modDirVersion}/extra/
    '';
  };
in
{
  options.services.superduperdriverpack.wmi.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Redmibook WMI kernel module.";
  };

  config = lib.mkIf cfg.enable {
    boot.extraModulePackages = [ wmiDrv ];
    boot.kernelModules = [ "redmibook_wmi" ];
    environment.systemPackages = [ wmiDrv ];
  };
}
