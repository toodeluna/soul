lib: lib.types.submodule {
  options = {
    name = lib.mkOption {
      description = "The name of the font.";
      type = lib.types.str;
    };

    package = lib.mkOption {
      description = "The package of the font.";
      type = lib.types.package;
    };
  };
}
