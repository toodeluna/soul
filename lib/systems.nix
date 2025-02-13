lib:
let
  /**
    Evaluates to either the specified Linux or Darwin value based on the host platform
    of the specified packages set.

    # Type

    ```
    ternary :: AttrSet -> Any -> Any -> Any
    ```

    # Example

    ```nix
    ternary pkgs "linux" "darwin"
    => "linux"
    ```

    # Arguments

    pkgs
    : The packages set to check against.

    linuxValue
    : The value to return for Linux.

    darwinValue
    : The value to return for Darwin.
  */
  ternary =
    pkgs: linuxValue: darwinValue:
    if pkgs.stdenv.hostPlatform.isLinux then
      linuxValue
    else if pkgs.stdenv.hostPlatform.isDarwin then
      darwinValue
    else
      throw "invalid system detected";
in
{
  inherit ternary;
}
