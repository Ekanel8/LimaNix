{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "doc";
  home.homeDirectory = "/home/doc";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/doc/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fish = {
	enable = true;
	shellInit = ''set -g fish_greeting ""'';
	shellAliases = {
		g = "git";
		"..." = "cd ../..";
		};
	};

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

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.dotfiles/Wallpapers/3.jpg" ];
      wallpaper = [ "eDP-1,~/.dotfiles/Wallpapers/3.jpg" ];
    };
  };

   # home.file.".config/hypr/hyprland.conf".text = ''
   #
   #'';

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
