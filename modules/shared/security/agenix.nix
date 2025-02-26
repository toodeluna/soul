{ self, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.agenix ];

  age.secrets = {
    password.file = "${self}/secrets/password.age";
  };
}
