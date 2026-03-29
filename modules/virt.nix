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
  };

  environment.systemPackages = with pkgs; [
    vagrant
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
