{ config, pkgs, ... }:
{
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
}
