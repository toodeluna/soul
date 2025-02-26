{ lib, config, ... }:
{
  options.custom.ssh.trustedKeys = lib.mkOption {
    description = "The trusted SSH keys.";
    default = [ ];
    type = lib.types.listOf lib.types.str;
  };

  config.users.users = lib.mkIf config.custom.ssh.enable {
    root.openssh.authorizedKeys.keys = config.custom.ssh.trustedKeys;
    profile.openssh.authorizedKeys.keys = config.custom.ssh.trustedKeys;
  };
}
