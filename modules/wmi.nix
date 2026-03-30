{ config, pkgs, lib, ... }:

let
  cfg = config.services.redmibook.wmi;

  wmiDrv = pkgs.stdenv.mkDerivation rec {
    pname = "redmibook_wmi";
    version = "1.0";

    src = pkgs.fetchFromGitHub {
      owner = "Ekanel8";
      repo = "Redmibook-2023-WMI-NixOS-Module";
      rev = "main";
      sha256 = "sha256-tW8Ft9h46uJc+Ch9KPk0tdk+w2BjfQtbFwS7k/GXjwk=";
    };

    buildInputs = [
      config.boot.kernelPackages.kernel.dev
      pkgs.gnumake
      pkgs.gcc
    ];

    buildPhase = ''
      make -C ${config.boot.kernelPackages.kernel.dev}/lib/modules/${config.boot.kernelPackages.kernel.dev.modDirVersion}/build \
        M=$PWD modules
    '';

    installPhase = ''
      mkdir -p $out/lib/modules/${config.boot.kernelPackages.kernel.dev.modDirVersion}/extra
      cp redmibook_wmi.ko \
         $out/lib/modules/${config.boot.kernelPackages.kernel.dev.modDirVersion}/extra/
    '';
  };
in
{
  options.services.redmibook.wmi.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable Redmibook WMI kernel module.";
  };

  config = lib.mkIf cfg.enable {
    boot.extraModulePackages = [ wmiDrv ];
    boot.kernelModules = [ "redmibook_wmi" ];
    environment.systemPackages = [ wmiDrv ];
  };
}
