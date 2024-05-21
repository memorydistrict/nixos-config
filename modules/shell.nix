#-+=+-------------------------+=+-#
#-+=+-: Nixos.Modules.Shell :-+=+-#
#-+=+-------------------------+=+-#

{ pkgs, ... } :

{
    environment.systemPackages = (with pkgs; [
        fish
        nushell
        zsh
    ]);
}
