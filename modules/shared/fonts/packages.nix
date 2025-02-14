{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.soul.fonts;
in
{
  options.soul.fonts = {
    enable = lib.mkEnableOption "fonts";

    monospace = lib.mkOption {
      description = "The monospace font to use.";
      type = lib.soul.types.font;

      default = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      };
    };

    nerd = lib.mkOption {
      description = "The nerd font to use.";
      type = lib.soul.types.font;

      default = {
        name = "JetBrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
    };

    gui = lib.mkOption {
      description = "The GUI font to use.";
      type = lib.soul.types.font;

      default = {
        name = "Work Sans";
        package = pkgs.work-sans;
      };
    };

    extra = lib.mkOption {
      description = "Extra fonts to install.";
      default = [ ];
      type = lib.types.listOf lib.types.package;
    };
  };

  config.fonts.packages = lib.mkIf cfg.enable (
    [
      cfg.monospace.package
      cfg.nerd.package
      cfg.gui.package
    ]
    ++ cfg.extra
  );
}
