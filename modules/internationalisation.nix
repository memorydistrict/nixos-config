#-+=+----------------------------------------+=+-#
#-+=+-: Nixos.Modules.Internationalisation :-+=+-#
#-+=+----------------------------------------+=+-#

# NixOS configuration for device internationalisation

# Requires `services.xserver.enabled`, value found in:
# `./gnome.nix`

{ pkgs, ... } :

{
    # Set timezone
    time.timeZone = "Australia/Melbourne";

    # X Keyboard layout
    services.xserver = {
        xkb.layout = "us";
    };

    # Internationalisation properties, supported options below:
    # https://sourceware.org/git/?p=glibc.git;a=blob;f=localedata/SUPPORTED
    i18n.defaultLocale = "en_AU.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_AU.UTF-8";
        LC_COLLATE = "C.UTF-8";
        LC_IDENTIFICATION = "en_AU.UTF-8";
        LC_MEASUREMENT = "en_AU.UTF-8";
        LC_MONETARY = "en_AU.UTF-8";
        LC_NAME = "en_AU.UTF-8";
        LC_NUMERIC = "en_AU.UTF-8";
        LC_PAPER = "en_AU.UTF-8";
        LC_TELEPHONE = "en_AU.UTF-8";
        LC_TIME = "en_AU.UTF-8";
    };

    # Packages
    environment.systemPackages = (with pkgs; [
        nuspell
        hyphen
        hunspell
        hunspellDicts.en_AU
        hunspellDicts.en_US
    ]);
}
