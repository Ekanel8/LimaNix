{ config, lib, pkgs, ... }:

{
  boot.kernel.sysctl."net.ipv4.ip_default_ttl" = 65;

  #networking.extraHosts = ''
  #  172.16.100.100 nexus.d-t.by
  #  172.16.100.100 openproject.d-t.by
  #'';
  #
  networking.wireguard.enable = true;

  #networking.proxy.default = "http://127.0.0.1:2080";

  services.openssh = {                                 # Enable the OpenSSH daemon
    enable = true;
    # settings = {
    #	 PermitRootLogin = "yes";
    #};
  };

  networking.hostName                  = "tardis";      # Define your hostname.
  networking.firewall.enable           = true;          # Basic firewall
  networking.networkmanager.enable     = true;          # Enable networking

  networking.networkmanager.settings = {                # infinity loop for search mb
    connection = {
      autoconnect = "true";
      autoconnect-retries = "-1";
      autoconnect-retries-interval = "1";
      };
  };
}
