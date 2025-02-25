{ config, ... }:
{
  users.users.profile = {
    createHome = true;
    uid = 501;
    home = "/Users/${config.custom.users.profile.username}";
  };
}
