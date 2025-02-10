{
  description = "My Nix flake containing system configurations, packages, utilities and more!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      lib = inputs.nixpkgs.lib.extend (final: prev: { soul = import ./lib prev; });
      specialArgs = { inherit lib; };
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs specialArgs; } ./parts;
}
