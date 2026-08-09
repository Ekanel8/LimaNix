{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gtk4
    gtk3
    papirus-icon-theme # Icons
    colloid-gtk-theme # Theme
    bibata-cursors
  ];
  environment.variables = {
    QT_QPA_PLATFORMTHEME = "gtk3"; # Global setting
  };
}
