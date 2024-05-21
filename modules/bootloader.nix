#-+=+------------------------------+=+-#
#-+=+-: Nixos.Modules.Bootloader :-+=+-#
#-+=+------------------------------+=+-#

# NixOS boot configuration

{ pkgs, ... } :

{
    boot.loader = {
        # Use systemd-boot EFI boot manager
        systemd-boot.enable = true;
        # Allow installation process to modify EFI boot variables
        efi.canTouchEfiVariables = true;
        timeout = 5;
    };

    # Initialize mounting of network/encrypted file systems before boot
    boot.initrd = {
        enable = true;
        systemd.enable = true;
    };

    # systemd boot console log level, hierarchy below (0-based index):
    # [ emerg, alert, crit, err, warning, notice, info, debug ]
    boot.consoleLogLevel = 4;

    # Initial boot screen configuration
    boot.plymouth = {
        enable = true;
    };

    services = {
        devmon.enable = true;
        gvfs.enable = true;
        udisks2.enable = true;
    };
}
