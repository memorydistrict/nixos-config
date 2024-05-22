#-+=+-------------------------------+=+-#
#-+=+-: Nixos.Modules.NixSettings :-+=+-#
#-+=+-------------------------------+=+-#

{ ... } :

{
    nix = {
        settings.allowed-users = [ "*" ];
        settings.trusted-users = [ "@wheel" ];
        settings.experimental-features = [
            "nix-command"
            "flakes"
        ];

        settings.auto-optimise-store = true;
        optimise.automatic = true;
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 14d";
        };

        # For manual garbage collection, run the following commands:

        # Find and remove redundant copies of identical store paths
        # `nix-store --optimise`

        # Optimise the Nix store, and remove unreferenced and obsolete store paths
        # `nix-store --gc`

        # Remove old generations of Nix user profiles
        # `nix-collect-garbage -d`
    };
}
