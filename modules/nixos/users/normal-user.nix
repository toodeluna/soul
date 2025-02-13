{ config, ... }:
{
  users.users.${config.soul.users.me.shortName}.isNormalUser = true;
}
