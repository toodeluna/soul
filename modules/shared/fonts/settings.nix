{
  pkgs,
  lib,
  config,
  ...
}:
let
  mkFontOption =
    name: default:
    lib.mkOption {
      inherit default;
      description = "The font to use for '${name}'.";

      type = lib.types.submodule {
        options = {
          package = lib.mkOption {
            description = "The font package.";
            type = lib.types.package;
          };

          name = lib.mkOption {
            description = "The name of the font.";
            type = lib.types.str;
          };
        };
      };
    };
in
{
  options.custom.fonts.settings = {
    monospace = mkFontOption "monospace" {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
    };

    nerd = mkFontOption "nerd" {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
  };

  config.fonts.packages =
    with config.custom.fonts.settings;
    lib.mkIf config.custom.fonts.enable [
      monospace.package
      nerd.package
    ];
}
