{ config, lib, pkgs, ... }:

{
  config = {
    boot.kernel.sysctl."net.ipv4.ip_default_ttl" = 65;
  };
}
