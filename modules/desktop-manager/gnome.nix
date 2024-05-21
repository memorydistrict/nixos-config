######  GNOME Desktop Environment.

{ config, pkgs, ... } :

{
  ######  Enable GNOME:
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  xdg.portal.enable = true;

  ######  Configure GNOME:
  services.xserver = {
    layout = "au";
    xkbVariant = "";
  };

  programs = {
    dconf.enable = true;
  };

  ######  Exclude default packages:
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos                # Image viewer
    gnome-tour                  # GNOME guide
  ]) ++ (with pkgs.gnome; [
    cheese                      # Webcam software
    gnome-music                 # Music player
    gnome-terminal              # Terminal console
    gedit                       # Text editor
    epiphany                    # Web browser
    geary                       # Email client
    evince                      # Document viewer
    gnome-characters            # 
    totem                       # Video player
    tali                        # Poker game
    iagno                       # Go game
    hitori                      # Sudoku game
    atomix                      # Puzzle game
  ]);
}
