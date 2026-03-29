{ config, pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting ""
    '';
  };
}
