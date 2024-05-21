#-+=+--------------+=+-#
#-+=+-: Packages :-+=+-#
#-+=+--------------+=+-#

# Packages for NixOS configuration

{ pkgs, ... }: {
    nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [];
    };

    environment.systemPackages = with pkgs; [
        # CLI Utilities
        bitwarden-cli
        bitwarden-menu
        coreutils
        git
        lynx
        mutt
        neofetch
        neovim
        newsboat
        nushell
        orca
        recutils
        ripgrep
        stow
        tree
        tuifeed
        unzip
        vim
        wmctrl
        wget
        zsh

        # Dev
        clang
        cmake
        gnumake
        gcc
        go
        jq
        nodejs
        python3
        sqlite

        # Messaging
        scli
        signal-cli
        signal-desktop

        # Multimedia
        ardour
        freecad
        gpicview
        id3v2
        kid3
        lua
        musikcube
        obs-studio
        picard
        puddletag
        reaper
        scdl
        spotify
        spotify-player
        vlc

        # Office
        libreoffice
        libqalculate
        qalculate-gtk

        # Sound
        pipewire
        pulseaudio
        pamixer

        # Networking & Connectivity
        blueman
        bluetuith
        bluez
        qbittorrent
        qFlipper
        speedtest-cli
        vnstat

        # System
        acpid
        btop
        font-manager
        kitty
        kitty-themes
        lshw

        # Themes
        catppuccin-gtk
        dracula-theme
        zuki-themes

        ### Icons
        elementary-xfce-icon-theme
        dracula-icon-theme
        zafiro-icons

        # Window Manager
        dunst
        libnotify
        rofi-wayland
        sww
        waybar
        wl-clipboard
        wmctrl
        xwayland

        # Xo
        xclip
        xcolor
        xdo
        xdotool
        xorg.xev
        xplr
        xsel
        xtitle
        xwinmosaic

        # Other
        home-manager
    ];

    fonts.packages = with pkgs; [
        font-awesome
        jetbrains-mono
        noto-fonts
        noto-fonts-emoji
        powerline-fonts
        powerline-symbols
        twemoji-color-font
        (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
}
