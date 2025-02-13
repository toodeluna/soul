{ inputs, ... }:
{
  imports = [ inputs.treefmt.flakeModule ];

  perSystem.treefmt = {
    projectRootFile = "flake.nix";

    settings.global.excludes = [
      ".gitattributes"
      ".github/*"
      "*.age"
      "justfile"
      "flake.lock"
    ];

    programs = {
      nixfmt.enable = true;
      deno.enable = true;
    };
  };
}
