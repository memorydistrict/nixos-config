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

    programs.zsh = {
        enable = true;
    };

    environment = {
        shells = [ pkgs.zsh ];
        sessionVariables = rec {
            EDITOR = "nvim";
        };
    };
}
