alias help := default
alias fmt := format

# List all the available recipes.
@default:
    just --list

# Format the entire source tree using nixfmt.
[group('Utilities')]
@format:
    nix fmt

# Update the Nix flake lock file.
[group('Inputs')]
@lock:
    nix flake lock

# Update the specified inputs or all inputs if none are specified.
[group('Inputs')]
@update *inputs:
    nix flake update {{ inputs }}

# Show the outputs of the Nix flake for the current system.
[group('Outputs')]
@show:
    nix flake show

# Show the ouputs of the Nix flake for all systems.
[group('Outputs')]
@show-all:
    nix flake show --all-systems

# Run the Nix flake checks for the current system.
[group('Outputs')]
@check:
    nix flake check

# Run the Nix flake checks for all systems.
[group('Outputs')]
@check-all:
    nix flake check --all-systems

# Rebuild the current system based on the specified hostname or the system's hostname if no hostname is specified.
[group('System')]
[macos]
@rebuild hostname='':
    darwin-rebuild switch --flake {{ if hostname != "" { ".#" + hostname } else { "." } }}

# Install nix-darwin and rebuild the current system based on the specified hostname or the system's hostname if no hostname is specified.
[group('System')]
[macos]
@provision hostname='':
    nix run nix-darwin/master#darwin-rebuild -- switch --flake {{ if hostname != "" { ".#" + hostname } else { "." } }}
