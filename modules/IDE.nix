{ config, pkgs, unstablepkgs,... }:
{
  environment.systemPackages = with pkgs; [
    gnumake                        # make
    jetbrains.goland               # Go IDE
    unstablepkgs.go                # Golang
    jetbrains.clion                # C/C++ IDE
    gcc                            # C/C++ compiler
    ninja                          # C/C++ builder
    unstablepkgs.cmake             # CMake
    jetbrains.pycharm-professional # Python IDE
    python314                      # Python
    zed-editor                     # Other stuff
    unstablepkgs.curlpp
  ];
}
