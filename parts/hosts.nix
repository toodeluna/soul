{ inputs, modules, ... }:
let
  perClassModules = {
    nixos = [
      inputs.disko.nixosModules.disko
      inputs.agenix.nixosModules.age
      inputs.home-manager.nixosModules.home-manager
      modules.nixos
    ];

    darwin = [
      inputs.homebrew.darwinModules.nix-homebrew
      inputs.agenix.darwinModules.age
      inputs.home-manager.darwinModules.home-manager
      modules.darwin
    ];
  };
in
{
  imports = [ inputs.easy-hosts.flakeModule ];

  easyHosts = rec {
    path = ../hosts;
    hosts = import path;

    shared = {
      modules = [ modules.shared ];
      specialArgs = { inherit modules; };
    };

    perClass = class: {
      modules = perClassModules.${class};
    };
  };
}
