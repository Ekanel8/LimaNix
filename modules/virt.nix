{ pkgs, ... }:
{
  programs.virt-manager.enable = true;
  users.extraGroups = {
     libvirt = {};
   };

  virtualisation = {
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
        #ovmf.enable = true;
        #ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };

    podman = {
      enable = true;

      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    podman-compose

    qemu

    virt-manager
    virt-viewer

    spice
    spice-gtk
    spice-protocol

    win-spice
    virtio-win
  ];
}
