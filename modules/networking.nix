#-+=+------------------------------+=+-#
#-+=+-: Nixos.Modules.Networking :-+=+-#
#-+=+------------------------------+=+-#

# NixOS networking configuration

{ ... } :

{
    # The device hostname
    networking.hostName = "asus-m3500qc";

    # Enable wireless support via wpa_supplicant
    # networking.wireless.enable = true;

    # Enable wireless support via NetworkManager
    # This option is easiest to use, and is utilized by most distros by default
    networking.networkmanager.enable = true;
}
