{ config, pkgs, lib, ... }:

let
  cfg = config.services.redmibook.wmi;

  kernel = config.boot.kernelPackages.kernel;

  wmiDrv = pkgs.stdenv.mkDerivation rec {
    pname = "redmibook_wmi";
    version = "1.0";

    src = pkgs.fetchFromGitHub {
      owner = "Ekanel8";
      repo = "Redmibook-2023-WMI-NixOS-Module";
      rev = "ded31334859aa1a7cfd50e84aa602c810a3abaac";
      sha256 = "sha256-zZdn3DaNGM9i2pP7XFfU6kxWDQ6GT85vzvloa8RPGNs=";
    };

    nativeBuildInputs = [
      pkgs.gnumake
      pkgs.gcc
      pkgs.pahole
      pkgs.openssl
    ] ++ kernel.moduleBuildDependencies;

    hardeningDisable = [ "pic" ];

    postUnpack = ''
      echo 'obj-m := redmibook_wmi.o' > $sourceRoot/Makefile
    '';

    buildPhase = ''
      make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build \
        M=$PWD modules
    '';

    installPhase = ''
      mkdir -p $out/lib/modules/${kernel.modDirVersion}/extra
      cp redmibook_wmi.ko $out/lib/modules/${kernel.modDirVersion}/extra/

      work=$(mktemp -d)
      openssl req -x509 -newkey rsa:2048 -nodes -days 36500 \
        -keyout "$work/key.pem" -out "$work/cert.pem" \
        -subj "/CN=nixos-redmibook-wmi/" >/dev/null 2>&1
      openssl x509 -in "$work/cert.pem" -outform DER -out "$work/cert.der"

      "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build/scripts/sign-file" \
        sha512 "$work/key.pem" "$work/cert.der" \
        $out/lib/modules/${kernel.modDirVersion}/extra/redmibook_wmi.ko

      install -D -m644 "$work/cert.der" \
        $out/lib/modules/${kernel.modDirVersion}/extra/redmibook_wmi.ko.cer
    '';

    meta = with lib; {
      description = "Redmibook WMI driver";
      license = licenses.gpl2;
      platforms = platforms.linux;
    };
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
  };
}
