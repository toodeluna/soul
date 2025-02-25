{ config, ... }:
{
  users.knownUsers = [ config.custom.users.profile.username ];
}
