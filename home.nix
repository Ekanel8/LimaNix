{ config, pkgs, ... }:
{
  home.username = "doc";
  home.homeDirectory = "/home/doc";
  home.stateVersion = "26.05";

  imports = [ ./modules/home ];
}
