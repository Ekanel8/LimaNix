{ config, pkgs, ... }:

{
  home.username = "doc";
  home.homeDirectory = "/home/doc";
  home.stateVersion = "25.05"; # Please DO NOT CHANGE

  home.packages = [

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    #smtng for dotfiles
  };
  # Home Manager can also manage your environment variables through
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true; # Do NOT CHANGE

  imports = [
    ./modules/home/fish.nix
    ./modules/home/kitty.nix
    ./modules/home/zed.nix
  ];



	#programs.fastfetch = {
	#enable = true;
	#settings = {
	#  logo = {
	#		source = "~/.dotfiles/Faces/NixOS.png";
	#		height = 14;
	#		};
	#  };
	#};




  programs.password-store = { enable = true; };

   gtk = {
     enable = true;
     theme = {
       name = "Graphite-Dark";
       package = pkgs.graphite-gtk-theme;
     };
     iconTheme = {
       name = "Papirus-Dark";
       package = pkgs.papirus-icon-theme;
     };
   };
   services.xsettingsd = {
     enable = true;
     settings = {
       "Net/ThemeName" = "Graphite-dark";
       "Net/IconThemeName" = "Papirus-Dark";
       "Gtk/FontName" = "Inter 10";
     };
   };
}
