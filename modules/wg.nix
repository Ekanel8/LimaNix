{ config, pkgs, ... }:
{
  networking.wg-quick.interfaces.bravo = {
    configFile = "/home/doc/.dotfiles/secrets/wg/bravo/domain.conf";
    autostart = false;
  };
}
