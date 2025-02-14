{
  pkgs,
  flakeDirectory,
  config,
  ...
}:
let
  publicKeys = import (flakeDirectory + "/data/public-keys.nix");
in
{
  imports = [
    ./disks.nix
    ./hardware.nix
  ];

  soul = {
    system = {
      name = "blackstar";
      flake = "/home/luna/github/toodeluna/soul";
    };

    users.me = {
      shortName = "luna";
      fullName = "Luna Heyman";
      email = "luna.heyman@proton.me";
    };

    ssh = {
      enable = true;
      keys = [ publicKeys.excalibur.luna ];
    };

    networking = {
      openPorts = [
        80
        443
      ];
      ssl.enable = true;
      nginx.enable = true;
    };
  };

  services.nginx.virtualHosts."toodeluna.gay" = {
    addSSL = true;
    enableACME = true;
    root = "/var/www/tempsite";
  };

  security.acme.certs."toodeluna.gay" = {
    dnsProvider = "porkbun";
    webroot = null;
    environmentFile = config.age.secrets.porkbun-credentials.path;
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];
}
