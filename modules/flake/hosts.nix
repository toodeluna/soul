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
    };

    perClass = class: {
      modules = lib.mkMerge [
        (lib.optionals (class == "nixos") [ ])

        (lib.optionals (class == "darwin") [
          inputs.homebrew.darwinModules.nix-homebrew
        ])
      ];
    };
  };
}
