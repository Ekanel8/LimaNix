{ config, pkgs, ... }:

{
  # Включаем поддержку виртуализации и Docker
  virtualisation.docker = {
    enable = true;
    # Опционально: разрешаем небезопасные реестры (если нужно)
    # extraOptions = ''"--insecure-registry=myregistry.com"'';
    # Опционально: разрешаем запуск без root (требует группу docker)
    enableOnBoot = false;
  };

  # Добавляем пользователя в группу docker (замените "youruser" на ваше имя)
  users.users.doc.extraGroups = [ "docker" ];

  # Опционально: устанавливаем docker-compose
  environment.systemPackages = with pkgs; [
    docker-compose
  ];

  # Для systemd: разрешаем linger для docker
  systemd.services.docker.serviceConfig = {
    Restart = "always";
  };
}
