#-+=+-------------------------+=+-#
#-+=+-: Nixos.Modules.Users :-+=+-#
#-+=+-------------------------+=+-#

# Define a user account.
# TODO: Set a password with `passwd`

{ pkgs, ... } :

{
    users.users.thomas = {
        isNormalUser = true;
        description = "thomas";
        extraGroups = [
            "audio"
            "input"
            "networkmanager"
            "tss"
            "video"
            "wheel"
        ];
        # Set the user's shell
        # TODO: Ensure the selected shell is enabled in `programs`
        shell = pkgs.zsh;
        packages = (with pkgs; [
            discord
            firefox
            floorp
            home-manager
            thunderbird
        ]);
    };

    programs.zsh = {
        enable = true;
        ohMyZsh = {
            enable = true;
            plugins = [ "git" ];
        };
    };

    environment = {
        shells = [ pkgs.zsh ];
        sessionVariables = rec {
            EDITOR = "nvim";
        };
    };
}
