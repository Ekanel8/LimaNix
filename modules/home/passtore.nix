{ config, pkgs, ... }:
{
  programs.password-store = {
    enable = true;
  };
}
