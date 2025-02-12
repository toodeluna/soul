alias help := default

# List all the available recipes.
@default:
	just --list

# Show the flake ouputs for the current system.
[group('Utilities')]
@show:
	nix flake show

# Show the flake ouputs for all systems.
[group('Utilities')]
@show-all:
	nix flake show --all-systems

# Check the flake ouputs.
[group('Utilities')]
@check:
	nix flake check

# Format the entire source tree.
[group('Utilities')]
@format:
	nix fmt

# Update the lock file.
[group('Inputs')]
@lock:
	nix flake lock

# Update the specified inputs or all inputs if none are specified.
[group('Inputs')]
@update *inputs:
	nix flake update {{ inputs }}

# Install nix-darwin and rebuild the current system based on the current hostname.
[group('Systems')]
[macos]
@provision:
	nix run nix-darwin/master#darwin-rebuild -- switch --flake .

# Install nix-darwin and rebuild the current system based on the specified hostname.
[group('Systems')]
[macos]
@provision-as hostname:
	nix run nix-darwin/master#darwin-rebuild -- switch --flake .#{{ hostname }}

# Rebuild the current system based on the current hostname.
[group('Systems')]
[macos]
@rebuild:
	darwin-rebuild switch --flake .

# Rebuild the current system based on the specified hostname.
[group('Systems')]
[macos]
@rebuild-as hostname:
	darwin-rebuild switch --flake .#{{ hostname }}
