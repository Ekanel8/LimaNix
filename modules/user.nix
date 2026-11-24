{ pkgs, ... }:
{
  users.users.doc = {
    isNormalUser  = true;
    description   = "doc";
    extraGroups   = [ "networkmanager" "wheel" "storage" "plugdev" "users" "libvirt" "docker" "battery_ctl"];
    packages      = with pkgs; [ ];
	  shell         = pkgs.fish;
  };
}
