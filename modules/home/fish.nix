{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting ""
    '';
    shellAliases = {
      set-env = "export (cat .env | xargs -L 1)";
      neton = "virsh net-start default";
      netoff = "virsh net-destroy default";
      zed = "zeditor";
    };
    functions = {
      copy = {
        description = "Copy file(s) to clipboard as file (Wayland)";
        body = ''
          for f in $argv
            echo "file://"(realpath $f)
          end | wl-copy -t text/uri-list
        '';
      };
    };
  };
}
