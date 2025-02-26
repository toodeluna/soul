{ self, pkgs, ... }:
let
  sshKeys = import (self + "/config/ssh.nix");
in
{
  custom = {
    users.profile = {
      name = "Luna Heyman";
      username = "luna";
    };

    ssh = {
      enable = true;
      trustedKeys = [ sshKeys.excalibur.luna ];
    };

    system.packages = {
      inherit (pkgs) neovim git;
    };
  };
}
