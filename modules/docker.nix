{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  users.users.doc.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];

  systemd.services.docker.serviceConfig = {
    Restart = "always";
  };
}
