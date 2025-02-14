{ self, inputs, ... }:
let
  perClassModules = {
    nixos = [
      inputs.disko.nixosModules.disko
      inputs.agenix.nixosModules.age
      inputs.home-manager.nixosModules.home-manager
      inputs.catppuccin.nixosModules.catppuccin
      self.nixosModules.default
    ];

    darwin = [
      inputs.homebrew.darwinModules.nix-homebrew
      inputs.agenix.darwinModules.age
      inputs.home-manager.darwinModules.home-manager
      self.darwinModules.default
    ];
  };
in
{
  imports = [ inputs.easy-hosts.flakeModule ];

  easyHosts = rec {
    path = ../hosts;
    hosts = import path;

    shared = {
      modules = [ self.sharedModules.default ];
    };

    perClass = class: {
      modules = perClassModules.${class};
    };
  };
}
