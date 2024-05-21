#-+=+-------------------------------+=+-#
#-+=+-: Nixos.Modules.NixSettings :-+=+-#
#-+=+-------------------------------+=+-#

{ ... } :

{
    nix.settings = {
        allowed-users = [ "@wheel" ];
        experimental-features = [ "nix-command" "flakes" ];
    };
}
