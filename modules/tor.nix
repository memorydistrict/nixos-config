#-+=+-----------------------+=+-#
#-+=+-: Nixos.Modules.Tor :-+=+-#
#-+=+-----------------------+=+-#

# NixOS configuration for Tor services

{ pkgs, ... } :

{
    services.tor = {
        enable = true;
        client.enable = true;
    };
    environment.systemPackages = (with pkgs; [
        tor-browser
    ]);
}
