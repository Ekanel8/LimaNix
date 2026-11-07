{ lib, pkgs, ... }:

let
  tuigreeter = pkgs.writeShellScript "tuigreet-greet" ''
    GREETING=$(${lib.getExe pkgs.fortune})
    exec ${lib.getExe pkgs.tuigreet} \
      --greeting "$GREETING" \
      --cmd "start-hyprland > /dev/null 2>&1" \
  '';
in

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "greeter";
        command = "${tuigreeter}";
      };
    };
  };
}
