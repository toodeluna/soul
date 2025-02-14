{ config, modules, ... }:
let
  username = config.soul.users.me.shortName;
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      systemConfiguration = config;
    };

    users.${username}.imports = [
      modules.home
    ];
  };
}
