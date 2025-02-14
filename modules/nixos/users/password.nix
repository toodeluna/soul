{ self, config, ... }:
let
  username = config.soul.users.me.shortName;
in
{
  age.secrets.password.file = self + "/secrets/password.age";

  users.users = {
    root.hashedPasswordFile = config.age.secrets.password.path;
    ${username}.hashedPasswordFile = config.age.secrets.password.path;
  };
}
