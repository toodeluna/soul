{
  self,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.easy-hosts.flakeModule ];

  easyHosts = {
    path = self + "/hosts";

    hosts = {
      excalibur = {
        class = "darwin";
        arch = "aarch64";
      };

      blackstar = {
        class = "nixos";
        arch = "x86_64";
      };
    };

    perClass = class: {
      modules = lib.mkMerge [
        [ (self + "/modules/shared") ]

        (lib.optionals (class == "nixos") [
          (self + "/modules/nixos")
          inputs.disko.nixosModules.disko
          inputs.agenix.nixosModules.default
        ])

        (lib.optionals (class == "darwin") [
          (self + "/modules/darwin")
          inputs.homebrew.darwinModules.nix-homebrew
          inputs.agenix.darwinModules.default
        ])
      ];
    };
  };
}
