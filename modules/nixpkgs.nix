#-+=+---------------------------+=+-#
#-+=+-: Nixos.Modules.Nixpkgs :-+=+-#
#-+=+---------------------------+=+-#

{ ... } :

{
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
}
