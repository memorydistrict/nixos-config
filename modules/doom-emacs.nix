# Doom Emacs integration in NixOS

{ config, pkgs, ... } :

{
  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  environment.systemPackages = (with pkgs; [
    emacs
    fd
  ]);
}
