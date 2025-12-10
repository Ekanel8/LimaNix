{ config, pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting ""
    '';

    functions = {
      tardis = ''
        set action $argv[1]
        set state $argv[2]
        switch "$action"
            case "virtnet"
                switch "$state"
                    case "start"
                        sudo virsh net-start default
                    case "stop"
                        sudo virsh net-destroy default
                    case "status"
                        sudo virsh net-list --all
                    end

            case "switch"
                switch "$state"
                    case "system"
                        sudo nixos-rebuild -v switch --flake "path:/home/doc/.dotfiles/"
                    case "home"
                        home-manager switch --flake ~/.dotfiles/
                    end
                    case "*"
                        echo "Empty input: $action"
                    end
      '';
    };
  };
}
