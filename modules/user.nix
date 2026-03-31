{ config, pkgs, ... }:
{
  users.users.doc = {
    isNormalUser  = true;
    description   = "doc";
    extraGroups   = [ "networkmanager" "wheel" "storage" "plugdev" "users" "libvirt" ];
    packages      = with pkgs; [ ];
	  shell         = pkgs.fish;
  };
}
