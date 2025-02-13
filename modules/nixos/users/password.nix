{ flakeDirectory, config, ... }:
let
  username = config.soul.users.me.shortName;
in
{
  age.secrets.password.file = flakeDirectory + "/secrets/password.age";

  users.users = {
    root.hashedPasswordFile = config.age.secrets.password.path;
    ${username}.hashedPasswordFile = config.age.secrets.password.path;
  };
}
