{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnumake                # make
    #jetbrains.goland                    # Go IDE
    go                     # Golang
    #jetbrains.clion                     # C/C++ IDE
    gcc                                 # C/C++ compiler
    ninja                               # C/C++ builder
    cmake                  # CMake
    #jetbrains.pycharm      # Python IDE
    python315                           # Python
    zed-editor             # Other stuff
    curlpp
  ];
}
