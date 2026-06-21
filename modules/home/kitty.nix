{ config, pkgs, ... }:

{
  programs.kitty = {
	enable = true;
	settings = {
    tab_bar_min_tabs = "2";
    tab_bar_edge = "bottom";
    tab_bar_style = "powerline";
    tab_powerline_style = "slanted";
    tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
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
}
