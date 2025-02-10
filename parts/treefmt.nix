{ inputs, ... }:
{
  imports = [ inputs.treefmt.flakeModule ];

  perSystem.treefmt = {
    projectRootFile = "flake.nix";

    settings.global.excludes = [
      ".gitattributes"
      "flake.lock"
    ];

    programs = {
      nixfmt.enable = true;
      deno.enable = true;
    };
  };
}
