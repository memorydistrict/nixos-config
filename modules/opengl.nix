#-+=+--------------------------+=+-#
#-+=+-: Nixos.Modules.Opengl :-+=+-#
#-+=+--------------------------+=+-#

# OpenGL drivers for NixOS
# Required for OpenGL support in X11 systems, and Wayland compositors

{ ... } :

{
    hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
    };
}
