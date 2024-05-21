#-+=+---------------------------+=+-#
#-+=+-: Nixos.Modules.Wayland :-+=+-#
#-+=+---------------------------+=+-#

# NixOS configuration for Wayland

{ pkgs, ... } :

{
    # Enable Hyprland
    programs.hyprland.enable = true;
    # If using an Nvidia GPU
    #programs.hyprland.enableNvidiaPatches = true;
    # If using Xserver applications
    # programs.hyprland.xwayland.enable = true;

    # Enable XDG portal use
    # GNOME and KDE provide this by default
    # xdg.portal.enable = true;
    # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    # Hint Electron apps to use Wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    # Invisible cursor fix, when running Hyprland
    environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

    # Packages
    environment.systemPackages = (with pkgs; [
        # Hyprland
        hyprcursor
        hypridle
        hyprlock
        hyprpicker
        pyprland

        # Wallpaper manager
        hyprpaper
        swww

        # Colorscheme
        pywal
        wallust

        # Extras
        cliphist
        dolphin
        dunst
        libnotify
        mako
        networkmanagerapplet
        nnn
        rofi-wayland
        waybar

        # Terminal emulator
        cool-retro-term
        wezterm

        # Text editor
        helix
        starship

        # Minimal multimedia applications
        imv
        mpv
        qutebrowser
        zathura
    ]);
}
