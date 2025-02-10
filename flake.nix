{
  description = "My Nix flake containing system configurations, packages, utilities and more!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    easy-hosts.url = "github:tgirlcloud/easy-hosts";

    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      lib = inputs.nixpkgs.lib.extend (final: prev: { soul = import ./lib prev; });
      flakeDirectory = ./.;
      specialArgs = { inherit lib flakeDirectory; };
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs specialArgs; } ./parts;
}
