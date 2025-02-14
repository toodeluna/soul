{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.soul.users.me;
in
{
  options.soul.users.me = {
    shortName = lib.mkOption {
      description = "Your first name in all lowercase.";
      example = "luna";
      type = lib.types.strMatching "([a-z0-9]+)";
    };

    fullName = lib.mkOption {
      description = "Your full name.";
      example = "Luna Heyman";
      type = lib.types.str;
    };

    email = lib.mkOption {
      description = "Your email address.";
      example = "contact@toodeluna.gay";
      type = lib.types.str;
    };
  };

  config.users.users.${cfg.shortName} = {
    description = cfg.fullName;
    home = "/${lib.soul.systems.ternary pkgs "home" "Users"}/${cfg.shortName}";
    createHome = true;
  };
}
