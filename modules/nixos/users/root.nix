{ config, ... }:
{
  users.users.root.hashedPasswordFile = config.age.secrets.password.path;
}
