{
  description = "My Nix flake containing system configurations, packages, utilities and more!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";

    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.treefmt.flakeModule ];

      systems = import inputs.systems;

      perSystem.treefmt = {
        projectRootFile = "flake.nix";

        programs = {
          nixfmt.enable = true;
          prettier.enable = true;
        };

        settings.global.excludes = [
          "LICENSE"
          "CODEOWNERS"
          ".gitattributes"
        ];
      };
    };
}
