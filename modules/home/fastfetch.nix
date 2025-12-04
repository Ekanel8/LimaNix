{ config, pkgs, ... }:
{
  programs.fastfetch = {
	enable = true;
	settings = {
	  logo = {
			source = "~/.dotfiles/Faces/NixOS.png";
			height = 14;
			};
	  };
	};
}
