lib: {
  files = import ./files.nix lib;
  systems = import ./systems.nix lib;
  types = import ./types lib;
}
