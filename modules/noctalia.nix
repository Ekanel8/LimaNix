{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  users.groups.battery_ctl = { };
  users.users.doc.extraGroups = [ "battery_ctl" ];
  services.udev.extraRules = ''
    ACTION=="add|change", SUBSYSTEM=="power_supply", KERNEL=="BAT*", RUN+="${pkgs.coreutils}/bin/chgrp battery_ctl /sys$devpath/charge_control_end_threshold", RUN+="${pkgs.coreutils}/bin/chmod 0664 /sys$devpath/charge_control_end_threshold"
  '';
}
