{ inputs, ... }:
{
  imports = [ inputs.treefmt.flakeModule ];

  perSystem.treefmt = {
    projectRootFile = "flake.nix";

    settings.global.excludes = [
      ".gitattributes"
      "*.age"
      "justfile"
      "flake.lock"
      "CODEOWNERS"
      "LICENSE"
    ];

    programs = {
      nixfmt.enable = true;
      deno.enable = true;
    };
  };
}
