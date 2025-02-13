{ lib, config, ... }:
let
  cfg = config.soul.users.me;
in
{
  options.soul.users.me = {
    password = lib.mkOption {
      description = "Your hashed password generated using `mkpasswd`.";
      example = "$y$j9T$20KiaI3fsUj4bvJDqy.iw.$Q6wh3rVy2mUPFKJs0XARHJFTkBhWQotS0sHWvnGS3E5";
      type = lib.types.str;
    };
  };

  config.users.users = {
    root.hashedPassword = cfg.password;
    ${cfg.shortName}.hashedPassword = cfg.password;
  };
}
