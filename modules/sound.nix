#-+=+-------------------------+=+-#
#-+=+-: Nixos.Modules.Sound :-+=+-#
#-+=+-------------------------+=+-#

# NixOS configuration to enable sound

{ pkgs, ... } :

{
    sound.enable = true;
    hardware.pulseaudio.enable = false;

    security.rtkit.enable = true;

    # Media keys configuration
    sound.mediaKeys = {
        enable = true;
        volumeStep = "1%";
    };

    # Enable sound through PipeWire
    services.pipewire = {
        enable = true;

        # Advanced Linux Sound Architecture (ALSA)
        # Audio and MIDI functionality
        alsa.enable = true;
        alsa.support32Bit = true;

        # JACK Audio Connection Kit
        # Sound server API
        jack.enable = true;

        # PulseAudio
        # Network-capable sound server
        pulse.enable = true;

        # Wireplumber support
        # PipeWire API wrapper
        wireplumber.enable = true;

        # Example session manager
        # This is enabled by default as there are currently no other packages
        # media-session.enable = true;
    };

    environment.systemPackages = (with pkgs; [
        pamixer
        pavucontrol
    ]);
}
