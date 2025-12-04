{ config, pkgs, ... }:

{
  home.username = "doc";
  home.homeDirectory = "/home/doc";
  home.stateVersion = "25.05"; # DO NOT CHANGE

  home.file = {
    #smtng for dotfiles
  };
  # Home Manager can also manage your environment variables through
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true; # DO NOT CHANGE

  imports = [
    ./modules/home/fish.nix
    ./modules/home/kitty.nix
    ./modules/home/zed.nix
    ./modules/home/gtk.nix
    #./modules/home/fastfetch.nix
    ./modules/home/passtore.nix
  ];
}
