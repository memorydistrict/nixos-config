#-+=+------------------------+=+-#
#-+=+-: System.AsusM3500qc :-+=+-#
#-+=+------------------------+=+-#

# NixOS configuration for ASUS VivoBook (M3500QC).

# Host: ASUSTeK COMPUTER INC. M3500QC
# CPU: AMD Ryzen 7 5800H with Radeon Graphics (16) @ 3.200GHz
# GPU: NVIDIA GeForce RTX 3050 Mobile
# GPU: AMD ATI Radeon Vega Series / Radeon Vega Mobile Series

{ ... } :

{
    # Nvidia module import disabled until a stable configuration is established.
    # imports = [ ../modules/graphics/nvidia.nix ];

    imports = [
        ../modules/nvidia.nix
        ../modules/opengl.nix
    ];
}
