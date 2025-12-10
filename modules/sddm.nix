{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    where-is-my-sddm-theme
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${pkgs.where-is-my-sddm-theme}/share/sddm/themes/where_is_my_sddm_theme";
  };
}
