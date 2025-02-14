{
  pkgs,
  self,
  config,
  ...
}:
let
  publicKeys = import (self + "/data/public-keys.nix");
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
      theme.enable = true;
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
      ssl.enable = true;
      nginx.enable = true;

      openPorts = [
        80
        443
      ];
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
    neovim
  ];
}
