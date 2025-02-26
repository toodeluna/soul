{
  self,
  pkgs,
  config,
  ...
}:
let
  sshKeys = import (self + "/config/ssh.nix");
in
{
  custom = {
    users.profile = {
      name = "Luna Heyman";
      username = "luna";
      email = "luna.heyman@proton.me";
    };

    ssh = {
      enable = true;
      trustedKeys = [ sshKeys.excalibur.luna ];
    };

    networking = {
      ssl.enable = true;
      nginx.enable = true;

      ports = [
        80
        433
      ];
    };

    system.packages = {
      inherit (pkgs) neovim git;
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
}
