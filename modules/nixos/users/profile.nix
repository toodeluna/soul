{ config, ... }:
let
  inherit (config.custom.users.profile) username;
in
{
  users = {
    groups.profile = {
      name = username;
    };

    users.profile = {
      isNormalUser = true;
      group = username;
      extraGroups = [ "wheel" ];
    };
  };
}
