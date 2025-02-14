{ self, config, ... }:
let
  user = config.soul.users.me;
  gitConfig = import (self + "/data/git-config.nix");
in
{
  programs.git = {
    enable = true;

    config = gitConfig.config // {
      inherit (gitConfig) aliases;

      user = {
        name = user.fullName;
        email = user.email;
      };
    };
  };
}
