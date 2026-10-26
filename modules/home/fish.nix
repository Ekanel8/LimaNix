{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting ""
    '';
    shellAliases = {
      setenv = "export (cat .env | xargs -L 1)";
    };
  };
}
