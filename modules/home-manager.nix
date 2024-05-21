#-+=+-------------------------------+=+-#
#-+=+-: NixOs.Modules.HomeManager :-+=+-#
#-+=+-------------------------------+=+-#

{ pkgs, ... } :

{
    environment.systemPackages = (with pkgs; [
        home-manager
    ]);
}
