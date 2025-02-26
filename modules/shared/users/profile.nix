{ lib, config, ... }:
{
  options.custom.users.profile = {
    username = lib.mkOption {
      type = lib.types.strMatching "([a-z0-9]+)";
      description = "The main user's username.";
      example = "luna";
    };

    name = lib.mkOption {
      type = lib.types.str;
      description = "The main user's full name.";
      example = "Luna Heyman";
    };

    email = lib.mkOption {
      type = lib.types.str;
      description = "The main user's email address.";
      example = "contact@toodeluna.gay";
    };
  };

  config.users.users.profile = {
    name = config.custom.users.profile.username;
    description = config.custom.users.profile.name;
  };
}
