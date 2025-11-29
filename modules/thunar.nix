{ pkgs, config, unstablepkgs, ... }:
{
  programs.thunar.enable = true;               # file manager
  programs.thunar.plugins = with pkgs.xfce; [
   thunar-volman                               # Automount
   unstablepkgs.xfce.thunar-archive-plugin     # Archive Ops
  ];
  services.gvfs.enable = true;                 # Allows thunar to see a drives
  services.udisks2.enable = true;              # Allows usb drives
  security.polkit.enable = true;               # Allow mount without root
  services.tumbler.enable = true;              # File preview
}
