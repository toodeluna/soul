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
      modules.shared
    ];

    perClass = class: {
      modules = perClassModules.${class};
    };
  };
}
