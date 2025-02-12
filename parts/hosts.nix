{
  inputs,
  modules,
  flakeDirectory,
  ...
}:
let
  perClassModules = {
    nixos = [ ];

    darwin = [
      inputs.homebrew.darwinModules.nix-homebrew
      modules.darwin
    ];
  };
in
{
  imports = [ inputs.easy-hosts.flakeModule ];

  easyHosts = rec {
    path = flakeDirectory + "/hosts";
    hosts = import path;

    shared.modules = [
      inputs.lix.nixosModules.default
      modules.shared
    ];

    perClass = class: {
      modules = perClassModules.${class};
    };
  };
}
