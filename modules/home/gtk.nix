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

    gtk3.extraConfig = {
      gtk-menu-images = true;
    };

    gtk4.extraConfig = {
      gtk-menu-images = true;
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
