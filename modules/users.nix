#-+=+-------------------------+=+-#
#-+=+-: Nixos.Modules.Users :-+=+-#
#-+=+-------------------------+=+-#

# Define a user account.
# TODO: Set a password with `passwd`
# TODO: Modularize `users.users`

{ pkgs, ... } :

{
    # Import users
#    imports = [
#        ./users/thomas.nix
#    ];

    users.users.thomas = {
        isNormalUser = true;
        description = "thomas";
        extraGroups = [ "wheel" ];
        # Set the user's shell
        # TODO: Ensure the selected shell is enabled in `./shell.nix`
        shell = pkgs.zsh;
        packages = (with pkgs; [
            discord
            firefox
#            floorp
#            home-manager
            thunderbird
        ]);
    };
}
