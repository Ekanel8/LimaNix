{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    libsForQt5.qtgraphicaleffects   # lib
	  where-is-my-sddm-theme          # theme
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${pkgs.where-is-my-sddm-theme.override { variants = [ "qt5" ]; }}/share/sddm/themes/where_is_my_sddm_theme_qt5";
  };
}
