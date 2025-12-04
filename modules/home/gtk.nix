{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Graphite-Dark";
      package = pkgs.graphite-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
  services.xsettingsd = {
    enable = true;
    settings = {
      "Net/ThemeName" = "Graphite-dark";
      "Net/IconThemeName" = "Papirus-Dark";
      "Gtk/FontName" = "Inter 10";
    };
  };
}
