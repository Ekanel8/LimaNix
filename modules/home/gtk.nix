{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
  services.xsettingsd = {
    enable = true;
    settings = {
      "Net/ThemeName" = "Colloid-Dark";
      "Net/IconThemeName" = "Papirus-Dark";
      "Gtk/FontName" = "Inter 10";
    };
  };
}
