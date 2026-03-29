{ pkgs, config, inputs, ... }:
{
  programs.thunar.enable = true;               # file manager
  programs.thunar.plugins = with pkgs; [
   thunar-volman                               # Automount
   thunar-archive-plugin                       # Archive Ops
  ];
  services.gvfs.enable = true;                 # Allows thunar to see a drives
  services.udisks2.enable = true;              # Allows usb drives
  security.polkit.enable = true;               # Allow mount without root
  services.tumbler.enable = true;              # File preview
}
