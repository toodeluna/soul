{ config, ... }:
let
  username = config.soul.users.me.shortName;
in
{
  users = {
    groups.${username} = { };

    users.${username} = {
      group = username;
      extraGroups = [ "wheel" ];
    };
  };
}
