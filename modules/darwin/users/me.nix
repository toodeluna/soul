{ config, ... }:
{
  users.users.${config.soul.users.me.shortName}.uid = 501;
}
