{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Fluent-Dark";
      package = pkgs.fluent-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
  services.xsettingsd = {
    enable = true;
    settings = {
      "Net/ThemeName" = "Fluent-Dark";
      "Net/IconThemeName" = "Papirus-Dark";
      "Gtk/FontName" = "Inter 10";
    };
  };
}
