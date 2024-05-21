#-+=+--------------------+=+-#
#-+=+-: Configuration : -+=+-#
#-+=+--------------------+=+-#

#   Edit this configuration file to define what should be installed on
#   your system.  Help is available in the configuration.nix(5) man page
#   and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
    security = {
        pam = {
            services = {
                gdm = { enableGnomeKeyring = true; };
            };
        };
        rtkit.enable = true;
    };

    # Daemon services
    services = {
        acpid = { enable = true; };
        compton = {
            enable = true;
            backend = "glx";
            vSync = true;
        };
        # Task scheduling
        cron = { enable = true; };
        fail2ban = { enable = true; };
    };

    # Packages
    environment.systemPackages = (with pkgs; [
        # System
        acpid
        bitwarden-cli
        bitwarden-menu
        btop
        clang
        cmake
        coreutils
        freecad
        font-manager
        gcc
        git
        go
        gpicview
        id3v2
###        juce
        jq
        kid3
        kitty                   # keep
        kitty-themes
###        lapce
        libreoffice
        libqalculate
        lshw
        lua
        lynx
###        music-player
        musikcube
        mutt
        neofetch
        neovim                  # keep
        newsboat
        nodejs
        orca
###        pavucontrol
        picard
        puddletag
        python3
        qalculate-gtk
        qbittorrent
        qFlipper
        recutils
        reaper
        ripgrep
        #rofi
        scdl
        scli
        signal-cli
        signal-desktop
        speedtest-cli
###        spek
        spotify
        spotify-player
        sqlite
        #sqlitebrowser
        stow
###        tap-plugins
        tree
        tuifeed
        unzip
        vim
        vnstat
###        vscode
###        w3m
        wmctrl
        wget
        xclip
        xcolor
        xdo
        xdotool
        xorg.xev
        xplr
        xsel
        xtitle
        xwinmosaic
    ]) ++ (with pkgs; [
        # Multimedia
        ardour
        gimp
        obs-studio
###        obs-studio-plugins.droidcam-obs
        vlc
    ]) ++ (with pkgs; [
        # Themes
        catppuccin-gtk
        dracula-theme
        zuki-themes
    ]) ++ (with pkgs; [
        elementary-xfce-icon-theme
        dracula-icon-theme
        zafiro-icons
    ]);

    system.stateVersion = "23.11";
}
