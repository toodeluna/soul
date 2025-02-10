{ inputs, flakeDirectory, ... }:
{
  imports = [ inputs.easy-hosts.flakeModule ];

  easyHosts = {
    path = flakeDirectory + "/hosts";

    hosts = {
      excalibur = {
        class = "darwin";
        arch = "aarch64";
      };
    };
  };
}
