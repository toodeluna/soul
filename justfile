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

# Rebuild the current system based on the specified hostname or the system's hostname if no hostname is specified.
[group('System')]
[linux]
@rebuild hostname='':
    nh os switch {{ if hostname != "" { "-H " + hostname } else { "" } }}

# Install nix-darwin and rebuild the current system based on the specified hostname or the system's hostname if no hostname is specified.
[group('System')]
[macos]
@provision hostname='':
    nix run nix-darwin/master#darwin-rebuild -- switch --flake {{ if hostname != "" { ".#" + hostname } else { "." } }}

# Garbage collect and optimize the Nix store.
[group('System')]
[macos]
@optimize:
    nix-collect-garbage --delete-old
    nix store optimise

# Edit the specified secret or add it if it doesn't exist.
[group('Secrets')]
[working-directory('secrets')]
@edit-secret name:
    agenix -e {{ name }}.age

# Rekey all the secrets with the new `secrets.nix` file.
[group('Secrets')]
[working-directory('secrets')]
@rekey-secrets:
    agenix -r

# Show the contents of the specified secret.
[group('Secrets')]
[working-directory('secrets')]
@decrypt-secret name:
    agenix -d {{ name }}.age
