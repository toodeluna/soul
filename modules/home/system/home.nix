{ systemConfiguration, ... }:
{
  home = rec {
    username = systemConfiguration.soul.users.me.shortName;
    homeDirectory = systemConfiguration.users.users.${username}.home;
    stateVersion = "25.05";
  };
}
