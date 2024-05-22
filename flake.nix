#-+=+--------------------------------+=+-#
#-+=+-: Nixos.Flake.Memorydistrict :-+=+-#
#-+=+--------------------------------+=+-#

# Nix flake for memorydistrict
# `sudo nixos-rebuild switch --flake /etc/nixos#memorydistrict`

{
    description = "memorydistrict.nix";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "nixpkgs/nixos-23.11";

        home-manager-unstable = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager-stable = {
            url = "github:nix-community/home-manager/release-23.11";
            inputs.nixpkgs.follows = "nixpkgs-stable";
        };
    };

    outputs = { home-manager, nixpkgs, self, ... } @ inputs:
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        nixosConfigurations = {
            memorydistrict = lib.nixosSystem {
                specialArgs = { inherit inputs; };
                inherit system;
                modules = [
                    # Initial Nix
                    ./configuration.nix
                    ./hardware-configuration.nix
                    # Modules
                    ./modules/bluetooth.nix
                    ./modules/bootloader.nix
                    ./modules/display-manager.nix
                    ./modules/dns.nix
                    ./modules/fonts.nix
                    ./modules/home-manager.nix
                    ./modules/internationalisation.nix
                    ./modules/networking.nix
                    ./modules/nix-settings.nix
                    ./modules/nixpkgs.nix
                    ./modules/nvidia.nix
                    ./modules/opengl.nix
                    ./modules/printing.nix
                    ./modules/shell.nix
                    ./modules/sound.nix
                    ./modules/tor.nix
                    ./modules/users.nix
                    ./modules/virtualisation.nix
                ];
            };
        };

        homeConfigurations = {
            thomas = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [ /home/thomas/.config/home-manager/home.nix ];
            };
        };
    };
}
