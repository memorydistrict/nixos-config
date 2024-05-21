#-+=+----------------------------------+=+-#
#-+=+-: Nixos.Modules.Virtualisation :-+=+-#
#-+=+----------------------------------+=+-#

# NixOS configuration for virtualisation
# TODO: Remove `users.users.thomas.extraGroups = [ "libvirtd" ];`

{ pkgs, ... } :

{
    # Enable Containerd
    # virtualisation.containerd.enable = true;

    # Enable Docker
    # virtualisation.docker.enable = true;
    # virtualisation.docker.rootless = {
    #     enable = true;
    #     setSocketVariable = true;
    # };

    # Enable dconf (system management tool)
    programs.dconf.enable = true;

    # Add user to libvirtd group
    users.users.thomas.extraGroups = [ "libvirtd" ];
    virtualisation.libvirtd.enable = true;

    # Enable Podman
    virtualisation.podman = {
        enable = true;
        # Create a `docker` alias for podman
        dockerCompat = true;
        # Required for containers under podman-compose to communicate
        defaultNetwork.settings.dns_enabled = true;
    };

    # Enable virtualisation via QEMU
#    virtualisation.qemu = {
        # SWTPM
#        swtpm.enable = true;

        # OVMF
#        ovmf.enable = true;
#        ovmf.packages = (with pkgs; [
#            OVMFFull.fd
#        ]);

        # USB compatibility via `spice`
#        spiceUSBRedirection.enable = true;
#    };

#    services.spice-vdagentd.enable = true;

    # Packages
    environment.systemPackages = (with pkgs; [
        distrobox
        qemu
        podman-compose
        podman-tui
#        spice
#        spice-gtk
#        spice-protocol
        virt-manager
        virt-viewer
        win-spice
        win-virtio
    ]);
}
