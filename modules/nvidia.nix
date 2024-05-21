#-+=+--------------------------+=+-#
#-+=+-: Nixos.Modules.Nvidia :-+=+-#
#-+=+--------------------------+=+-#

# NixOS configuration for Nvidia GPU compatibility

# FIX: Kernel continuously logs the following, upon waking after suspension:
# `NVRM kbusVerifyBar2_GM107: MMUTest BAR0 window offset 0x70f000 returned garbage 0x0`

{ config, lib, ... } :

let
    # TODO: Enter the appropriate PCI values in the variables below
    # Run either of the following commands to get your system's ID values:
    # nix shell nixpkgs#pciutils -c lspci | grep ' VGA '
    # sudo lshw -c display | grep --color -i -E "pci@[0-9]{4}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}\.[0-9]|driver=([a-zA-Z0-9]*)"
    INTEGRATED_ID = "PCI:4:0:0";
    DEDICATED_ID = "PCI:1:0:0";
in
{
    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        # Required for Wayland compositors and some desktop environments
        # WARNING: Requires `./opengl.nix`
        modesetting.enable = true;

        # Enable this if you have graphical corruption issues or application
        # crashes after waking up from sleep mode
        # This fixes it by saving the entire VRAM memory to /tmp/ instead of
        # the bare essentials
        powerManagement = {
            enable = true;
            # Turn off the GPU when not in use
            # Experimental; only works on modern Nvidia GPUs (Turing or newer)
            finegrained = true;
        };

        # Use the Nvidia open source kernel module
        # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
        open = true;
        # Enable the Nvidia settings menu
        # `nvidia-settings`
        nvidiaSettings = true;
        # Optionally, you may need to select the appropriate drive version
        # for your CPU
        package = config.boot.kernelPackages.nvidiaPackages.stable;

        # Optimize the power consumption and performance of laptops equipped
        # with Nvidia GPUs, seamlessly switching between integrated graphics
        # during lightweight tasks to save power, and the dedicated Nvidia
        # GPU for performance-intensive tasks
        prime = {
            offload = {
                enable = true;
                enableOffloadCmd = true;
            };

            # Integrated
            amdgpuBusId = "${INTEGRATED_ID}";
            # amdgpuBusId = "PCI:4:0:0";
            # intelBusId = "PCI:0:0:0";

            # Dedicated
            nvidiaBusId = "${DEDICATED_ID}";
            # nvidiaBusId = "PCI:1:0:0";
        };
    };

    # `nvidia-sync` NixOS specialization
    # Provides the ability to switch the Nvidia Optimus Prime profile
    # to sync mode during the boot process, enhancing performance
    specialisation = {
        nvidia-sync.configuration = {
            system.nixos.tags = [ "nvidia-sync" ];
            hardware.nvidia = {
                powerManagement.finegrained = lib.mkForce false;

                prime.offload.enable = lib.mkForce false;
                prime.offload.enableOffloadCmd = lib.mkForce false;

                prime.sync.enable = lib.mkForce true;
                # Intelligently and automatically shift power between
                # the CPU and GPU in real-time, based on the workload
                # of your game or application
                # WARNING: Requires an RTX GPU
                dynamicBoost.enable = lib.mkForce true;
            };
        };
    };
}
