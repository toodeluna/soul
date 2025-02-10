{ inputs, flakeDirectory, ... }:
let
  perClassModules = {
    nixos = [];
    darwin = [ inputs.homebrew.darwinModules.nix-homebrew ];
  };
in
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

    shared.modules = [
      inputs.lix.nixosModules.default
    ];

    perClass = class: {
      modules = perClassModules.${class};
    };
  };
}
