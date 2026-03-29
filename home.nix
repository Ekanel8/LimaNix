{ config, pkgs, ... }:
{
  home.username = "doc";
  home.homeDirectory = "/home/doc";
  home.stateVersion = "25.11";

  imports = [
    #./hyprland.nix
    ./modules/home/fish.nix
    ./modules/home/kitty.nix
    ./modules/home/zed.nix
    ./modules/home/gtk.nix
    ./modules/home/passtore.nix
  ];
}
