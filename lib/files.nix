lib:
let
  /**
    Either returns the path of the specified file or recursively collects the path
    of all the files in the directory except the `default.nix` file.

    # Type

    ```
    collectModuleImport :: Path -> String -> String -> [Path]
    ```

    # Example

    ```nix
    collectModuleImport ./. "foo.nix" "regular"
    => [ ./foo.nix ]

    collectModuleImport ./. "bar" "directory"
    => [ ./bar/baz.nix ./bar/foo.nix ]
    ```

    # Arguments

    rootPath
    : The directory to collect from.

    fileOrDirectoryPath
    : The path of the file or directory to collect.

    fileOrDirectoryType
    : The type of path to collect.
  */
  collectModuleImport =
    rootPath: fileOrDirectoryPath: fileOrDirectoryType:
    let
      fullPath = rootPath + "/${fileOrDirectoryPath}";
    in
    if fileOrDirectoryType == "directory" then collectModuleImports fullPath else fullPath;

  /**
    Recursively collects every file in a module into a list except the `default.nix` file.

    # Type

    ```
    collectModuleImports :: Path -> [Path]
    ```

    # Example

    ```nix
    collectModuleImports ./.
    => [ ./foo.nix ./bar/baz.nix ]
    ```

    # Arguments

    directory
    : The directory containing the `default.nix` file of the module.
  */
  collectModuleImports =
    directory:
    directory
    |> builtins.readDir
    |> lib.attrsets.mapAttrsToList (collectModuleImport directory)
    |> lib.lists.flatten
    |> builtins.filter (filePath: filePath != directory + "/default.nix");
in
{
  inherit collectModuleImport collectModuleImports;
}
