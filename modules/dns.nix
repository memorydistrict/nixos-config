#-+=+-----------------------+=+-#
#-+=+-: Nixos.Modules.Dns :-+=+-#
#-+=+-----------------------+=+-#

# NixOS DNS configuration

{ ... } :

{
    # Disable DNS services over NetworkManager, in favor of dnscrypt-proxy2
    networking = {
        nameservers = [
            # localhost
            "127.0.0.1"
            "::1"
        ];
        networkmanager.dns = "none";
    };

    services.dnscrypt-proxy2 = {
        enable = true;
        settings = {
            ipv6_servers = true;
            require_dnssec = true;

            sources.public-resolvers = {
                urls = [
                    "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
                    "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
                ];
                cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
                minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
            };

            # A list of compatible server names can found in the link below:
            # https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
            server_names = [
                "cloudflare"
                "cloudflare-ipv6"
                "cloudflare-security"
                "cloudflare-security-ipv6"
                "adguard-dns-doh"
                "mullvad-adblock-doh"
                "mullvad-doh"
                "nextdns"
                "nextdns-ipv6"
                "quad9-dnscrypt-ipv4-filter-pri"
                "google"
                "google-ipv6"
                "ibksturm"
            ];
        };
    };

    systemd.services.dnscrypt-proxy2.serviceConfig = {
        StateDirectory = "dnscrypt-proxy";
    };
}
