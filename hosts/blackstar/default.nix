{ pkgs, flakeDirectory, ... }:
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

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];
}
