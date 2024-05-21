#-+=+-------------------------+=+-#
#-+=+-: Nixos.Modules.Gnome :-+=+-#
#-+=+-------------------------+=+-#

# NixOS configuration for GNOME Desktop Manager

{ pkgs, ... } :

{
    # Enable Xserver
    services.xserver.enable = true;

    # Enable GNOME
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Exclude GNOME packages
    environment.gnome.excludePackages = (with pkgs; [
        gnome-tour
    ]) ++ (with pkgs.gnome; [
        atomix
        epiphany
        gnome-terminal
        gedit
        geary
        hitori
        iagno
        tali
    ]);
}
