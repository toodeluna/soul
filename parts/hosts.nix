{
  inputs,
  modules,
  flakeDirectory,
  ...
}:
let
  perClassModules = {
    nixos = [
      inputs.disko.nixosModules.disko
    ];

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
      modules.shared
    ];

    perClass = class: {
      modules = perClassModules.${class};
    };
  };
}
