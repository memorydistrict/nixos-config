#-+=+----------------------------------+=+-#
#-+=+-: Nixos.Modules.DisplayManager :-+=+-#
#-+=+----------------------------------+=+-#

# NixOS configuration for the display manager

{ pkgs, ... } :

{
    # Import desktop-manager
    imports = [
        ./desktop-manager/wayland.nix
    ];

    # Enable `greetd` display manager
    services.greetd.enable = true;
    services.greetd.settings = {
        default_session = {
            command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
            user = "greeter";
        };
    };

    # Packages
    environment.systemPackages = (with pkgs; [
        greetd.tuigreet
    ]);
}
