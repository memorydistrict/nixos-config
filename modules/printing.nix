#-+=+----------------------------+=+-#
#-+=+-: Nixos.Modules.Printing :-+=+-#
#-+=+----------------------------+=+-#

# NixOS configuration for printing

{ ... } :

{
    # Enable CUPS to print documents
    services.printing.enable = true;
    services.avahi = {
        enable = true;
        nssmdns4 = true;
    };

    # Enable SANE to scan documents
    hardware.sane.enable = true;
}
