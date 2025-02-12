{ config, ... }:
{
  users.knownUsers = [ config.soul.users.me.shortName ];
}
