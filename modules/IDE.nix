{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    unstablepkgs.gnumake                # make
    jetbrains.goland                    # Go IDE
    go                     # Golang
    jetbrains.clion                     # C/C++ IDE
    gcc                                 # C/C++ compiler
    ninja                               # C/C++ builder
    unstablepkgs.cmake                  # CMake
    jetbrains.pycharm-professional      # Python IDE
    python315                           # Python
    zed-editor             # Other stuff
    curlpp
  ];
}
