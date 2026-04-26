{ config, lib, pkgs, ... }:

{
  boot.kernel.sysctl."net.ipv4.ip_default_ttl" = 65;   # free access point

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
