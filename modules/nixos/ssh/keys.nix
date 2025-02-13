{ lib, config, ... }:
let
  cfg = config.soul.ssh;
  username = config.soul.users.me.shortName;
in
{
  options.soul.ssh.keys = lib.mkOption {
    description = "The authorized SSH keys.";
    default = [ ];
    type = lib.types.listOf lib.types.str;
  };

  config = lib.mkIf cfg.enable {
    users.users.root.openssh.authorizedKeys.keys = cfg.keys;
    users.users.${username}.openssh.authorizedKeys.keys = cfg.keys;
  };
}
