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
    system.flakePath = "/home/luna/github/toodeluna/flake";

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
        443
      ];
    };

    system.packages = {
      inherit (pkgs) neovim git;
    };
  };

  services.nginx.virtualHosts."toodeluna.gay" = {
    forceSSL = true;
    enableACME = true;
    root = "/var/www/tempsite";
  };
}
