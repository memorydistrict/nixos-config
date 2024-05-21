#-+=+-------------------------------------+=+-#
#-+=+-: Nixos.Modules.GarbageCollection :-+=+-#
#-+=+-------------------------------------+=+-#

# NixOS configuration for automated garbage collection

{ ... } :

{
    # Optimize Nix storage
    nix.settings.auto-optimise-store = true;
    nix.optimise.automatic = true;

    # Scheduled garbage collection
    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
    };

    # For manual garbage collection, run the following commands:

    # Find and remove redundant copies of identical store paths
    # `nix-store --optimize`

    # Optimize the Nix store, and remove unreferenced and obsolete store paths
    # `nix-store --gc`

    # Remove old generations of Nix user profiles
    # `nix-collect-garbage -d`
}
