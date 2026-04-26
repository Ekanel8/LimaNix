{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnumake                # make
    go                     # Golang
    gcc                                 # C/C++ compiler
    ninja                               # C/C++ builder
    cmake                  # CMake
    python315                           # Python
    zed-editor             # Other stuff
    curlpp
    vscode
  ];
}
