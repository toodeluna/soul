{ pkgs, flakeDirectory, config, ... }:
let
  publicKeys = import (flakeDirectory + "/data/public-keys.nix");
in
{
  imports = [
    ./disks.nix
    ./hardware.nix
  ];

  soul = {
    system.name = "blackstar";

    users.me = {
      shortName = "luna";
      fullName = "Luna Heyman";
    };

    ssh = {
      enable = true;
      keys = [ publicKeys.excalibur.luna ];
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts."toodeluna.gay" = {
      addSSL = true;
      enableACME = true;
      root = "/var/www/tempsite";
    };
  };

  age.secrets.porkbun-credentials.file = flakeDirectory + "/secrets/porkbun-credentials.age";

  security.acme = {
    acceptTerms = true;
    defaults.email = "luna.heyman@proton.me";

    certs."toodeluna.gay" = {
      dnsProvider = "porkbun";
      webroot = null;
      environmentFile = config.age.secrets.porkbun-credentials.path;
    };
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];
}
