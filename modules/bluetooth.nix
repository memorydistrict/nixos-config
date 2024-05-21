#-+=+-----------------------------+=+-#
#-+=+-: Nixos.Modules.Bluetooth :-+=+-#
#-+=+-----------------------------+=+-#

# NixOS configuration for Bluetooth compatibility

{ pkgs, ... } :

{
    # Bluetooth hardware options
    hardware.bluetooth = {
        enable = true;
        # Power up the default Bluetooth controller on boot
        powerOnBoot = false;
    };

    # GTK+ Bluetooth manager daemon
    services.blueman.enable = true;

    # Packages
    environment.systemPackages = (with pkgs; [
        blueman
        bluetuith
        bluez
    ]);
}
