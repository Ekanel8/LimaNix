{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gtk4
    gtk3
    papirus-icon-theme # Icons
    graphite-gtk-theme # Theme
  ];
  environment.variables = {
    QT_QPA_PLATFORMTHEME = "gtk3"; # Global setting
  };
}
