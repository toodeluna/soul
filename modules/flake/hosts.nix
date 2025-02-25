{ self, inputs, ... }:
let
  perClassModules = {
    nixos = [ ];
    darwin = [ inputs.homebrew.darwinModules.nix-homebrew ];
  };
in
{
  imports = [ inputs.easy-hosts.flakeModule ];

  easyHosts = {
    path = self + "/hosts";

    hosts = {
      excalibur = {
        class = "darwin";
        arch = "aarch64";
      };
    };

    perClass = class: {
      modules = perClassModules.${class};
    };
  };
}
