#-+=+-------------------------+=+-#
#-+=+-: Nixos.Modules.Fonts :-+=+-#
#-+=+-------------------------+=+-#

# NixOS configuration for fonts

{ pkgs, ... } :

{
    fonts.packages = (with pkgs; [
        times-newer-roman
        # Nerd Fonts
        comic-mono
        jetbrains-mono
        nerd-font-patcher
    ]);
}
