# Nvidia support module for NixOS
# https://nixos.wiki/wiki/Nvidia

{ config, lib, pkgs, ... } :

{
    # If not already enabled in configuration.nix, enable OpenGL:
    hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
    };

    # Enable Nvidia driver for Xorg and Wayland:
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        modesetting.enable = true;
        # Support is limited to Turing and later architectures:
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Obtain bus ID values for configuring Optimus PRIME, by running
    # `sudo lshw -c display`. For each entry, you'll need to take note
    # of the following values (in order of appearance):
    #   - `bus info`
    #   - `configuration.driver`
    # The following grep command will isolate these values:
    # sudo lshw -c display | grep --color -i -E "pci@[0-9]{4}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}\.[0-9]|driver=([a-zA-Z0-9]*)
    #
    # The bus ID will appear in the format of `hx:hx.d`, where:
    #   - `hx` is a hexadecimal value, and
    #   - `d` is a decimal value
    #
    # This value then needs to be converted to `d:d:d`. No padding is
    # required; meaning, if the hexadecimal value converts to a decimal
    # value of "14", it's "14". If it comes back as "2", it's "2".
    hardware.nvidia.prime = {
        offload = {
            enable = true;
            enableOffloadCmd = true;
        };
        # Integrated
        amdgpuBusId = "PCI:4:0:0";
        # intelBusId = "PCI:0:0:0";

        # Dedicated
        nvidiaBusId = "PCI:1:0:0"; 
    };

    specialisation = {
        gaming-time.configuration = {
            hardware.nvidia = {
                prime.sync.enable = lib.mkForce true;
                prime.offload = {
                    enable = lib.mkForce false;
                    enableOffloadCmd = lib.mkForce false;
                };
            };
        };
    };

    # Optimus PRIME (A): Offload mode
    # Tasks are handled by the CPU, with the GPU in a sleep state. The
    # GPU is only active when it is called by an offload function (a shell
    # script for which can be in `./nvidia-offload.sh`).
    # In order to allow this, you must declare the following:

#    hardware.nvidia.prime.offload = {
#        enable = true;
#        enableOffloadCmd = true;
#    };

    # Troubleshooting method for graphical corruption and system crashes
    # on suspend/resume (is itself unstable and known to cause suspend
    # issues):
#    hardware.nvidia.powerManagement = {
#        enable = true;
        # An additional option for Turing (or later) architectures:
#        finegrained = true;
#    };
}
