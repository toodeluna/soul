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
      inputs.agenix.nixosModules.age
      modules.nixos
    ];

    darwin = [
      inputs.homebrew.darwinModules.nix-homebrew
      inputs.agenix.darwinModules.age
      modules.darwin
    ];
  };
in
{
  imports = [ inputs.easy-hosts.flakeModule ];

  easyHosts = rec {
    path = flakeDirectory + "/hosts";
    hosts = import path;

    shared = {
      modules = [ modules.shared ];
      specialArgs = { inherit flakeDirectory; };
    };

    perClass = class: {
      modules = perClassModules.${class};
    };
  };
}
