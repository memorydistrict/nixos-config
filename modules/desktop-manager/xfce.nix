######  XFCE Desktop Environment.

{ config, pkgs, ... } :

{
  ######  Enable XFCE:
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  };

  ######  Configure XFCE:
  services = {
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  security.pam.services.gdm.enableGnomeKeyring = true;

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  ######  Exclude default packages:
  services.xserver.excludePackages = with pkgs; [
    xterm                       # 
  ];

  ######  Install XFCE-related packages
  environment.systemPackages = (with pkgs; [
    blueman                     # Bluetooth manager
    libqalculate                # Advanced calculator library
    font-manager                # Font manager for GTK environments
    orca                        # Screen reader
    pavucontrol                 # PulseAudio volume control
    qalculate-gtk               # GTK interface for Qalculate
    wmctrl                      # CLI X window controller
    xclip                       # Access X clipboard from a console application
    xdo                         # Perform elementary actions on windows
    xdotool                     # Fake keyboard/mouse input, window management, etc.
    xorg.xev                    # 
    xsel                        # Get/set contents of an X selection
    xtitle                      # Output X window titles
    xwinmosaic                  # X window switcher drawing a colorful grid
  ]) ++ (with pkgs; [
    # Themes
    catppuccin-gtk              # Catppuccin
    dracula-theme               # Dracula
    zuki-themes                 # Zukitre & Zukitwo
  ]) ++ (with pkgs; [
    # Icons
    elementary-xfce-icon-theme
    dracula-icon-theme          # Dracula
    zafiro-icons                # Zafiron
  ]) ++ (with pkgs.xfce; [
    catfish                     # 
    gigolo                      # 
    orage                       # 
    xfburn                      # 
    xfce4-appfinder             # 
    xfce4-clipman-plugin        # 
    xfce4-cpugraph-plugin       # 
    xfce4-dict                  # 
    xfce4-fsguard-plugin        # 
    xfce4-genmon-plugin         # 
    xfce4-netload-plugin        # 
    xfce4-panel                 # 
    xfce4-pulseaudio-plugin     # 
    xfce4-systemload-plugin     # 
    xfce4-weather-plugin        # 
    xfce4-whiskermenu-plugin    # 
    xfce4-xkb-plugin            # 
    xfdashboard                 # 
  ]);

  ######  Personalize
  services.xserver.displayManager.lightdm.greeters.slick = {
    enable = true;
    theme.name = "Zukitre-dark";
  };
}
