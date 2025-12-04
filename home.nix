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

  programs.kitty = {
	enable = true;
	settings = {
		font_family          = "JetBrains Mono";
		font_size            = "14.0";
		window_padding_width = "10";
		confirm_os_window_close = "0";
		foreground           = "#c0caf5";
		background           = "#1a1b26";
		background_opacity   = "1";
		selection_foreground = "#ffffff";
		selection_background = "#14b8a6";
		color0               = "#0b0c15";
		color1               = "#d2556c";
		color2               = "#7cd47b";
		color3               = "#efb184";
		color4               = "#6ca1f3";
		color5               = "#b78df0";
		color6               = "#69bcf4";
		color7               = "#c0caf5";
		color8               = "#39404a";
		color9               = "#f7768e";
		color10              = "#85e89d";
		color11              = "#f4cf8d";
		color12              = "#8fb9ff";
		color13              = "#d9a3ff";
		color14              = "#8fd3ff";
		color15              = "#f0f3f6";
	};
  };
 programs.zed-editor = {
    enable = true;
    extensions = [
      "one-dark"  #theme
      "nix"       #.nix support
    ];
    userSettings = {
      theme = "One Dark";
      ui_font_size = 16;
      buffer_font_size = 15;
    };
  };

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
