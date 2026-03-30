{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, E, killactive,"
        #"$mainMod, M, exit,"
        "$mainMod, C, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo," # dwindle
        "$mainMod, J, togglesplit," # dwindle
        "$mainMod, 211, exec, zeditor /home/doc/.dotfiles"
        "$mainMod, B, exec, firefox"
        "$mainMod, P, exec, OBSIDIAN_USE_WAYLAND=1 obsidian --ozone-platform=wayland --enable-features=UseOzonePlatform"
        "$mainMod, F, fullscreen"
        #"$mainMod, I, exec, ~/.config/extra/wofifavs.sh"
        ", Print, exec, grim - | tee ~/Screenshots/$(date +'%d.%m_%H:%M').png | wl-copy" #redo
        ", 157, exec, grim -g \"$(slurp -d)\" - | tee ~/Screenshots/$(date +'%d.%m_%H:%M').png | wl-copy" #redo
        ", 234, exec, noctalia-shell ipc call sessionMenu lockAndSuspend"
        ", 211, exec, noctalia-shell ipc call settings toggle"
        ", 210, exec, noctalia-shell ipc call wallpaper random"
        #", 156, exec, scrcpy"
      ];
    };
  };
}
