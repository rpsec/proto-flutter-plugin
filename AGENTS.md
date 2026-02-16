# AGENTS.md

This file contains instructions and context for AI agents (and humans) working on this repository.

## Project Structure

- `src/`: Source code for the Rust plugin.
- `tests/`: Integration tests.
- `docs/`: Documentation files.
- `CONTRIBUTING.md`: Contribution guidelines.
- `build-wasm.sh`: Script to build the optimized WASM plugin.
- `Cargo.toml`: Rust project configuration.
- `.moon/`: moon repository configuration directory.
- `moon.yml`: Project-level moon task definitions.
- `.prototools`: Proto tool versions configuration.

## Build Requirements

The project compiles to WASM using `cargo`. The `build-wasm.sh` script performs additional optimization steps that require external tools:

- `cargo` with `wasm32-wasip1` target.
- `wasm-opt` from [Binaryen](https://github.com/WebAssembly/binaryen).
- `wasm-strip` from [WABT](https://github.com/WebAssembly/wabt).

The script **hardcodes** these tool paths to `~/Dev/web-assembly-binaryen/bin/` and `~/Dev/web-assembly-wabt/bin/`. If you are asked to fix build issues related to these tools, checking/updating these paths in `build-wasm.sh` is a primary step.

### moon Tasks

This repository is set up as a moon repository with the following tasks:

- `moon run :format` - Format code using cargo fmt
- `moon run :format-check` - Check code formatting
- `moon run :lint` - Lint code using cargo clippy
- `moon run :build` - Build the project for development
- `moon run :build-wasm` - Build the WASM plugin (requires wasm32-wasip1 target)
- `moon run :test` - Run all tests
- `moon run :check` - Run format-check, lint, and test
- `moon run :clean` - Clean build artifacts

### proto Integration

The repository uses proto to manage Rust toolchain versions. The Rust version is specified in `.prototools` and is managed by moon through `.moon/toolchain.yml`.

### VCS Hooks

A pre-push hook is configured to run linting and tests automatically before pushing. Install it with:
```sh
moon sync hooks
```

This ensures code quality by running `:lint` and `:test` tasks before each push.

## Testing

The project uses `proto_pdk_test_utils` for integration testing. Key test files are:
- `tests/download_test.rs`: Verifies that the correct download URLs and archives are constructed for different platforms (Linux, macOS, Windows).
- `tests/versions_test.rs`: Verifies version resolution logic.

Integration tests often require a mock proto environment.
- Specifically, `installs_tool` test may fail if `~/.proto/bin/proto-shim` does not exist. A dummy executable should be created there to simulate the shim.

## Known Issues / Context

- **Requirements**: This plugin requires `proto` v0.47.0 or newer.
- **Upgrades**: The plugin does not support `flutter upgrade`. Version management should be done via `proto`.

## Code Style

- Follow standard Rust formatting (`cargo fmt` or `moon run :format`).
- Ensure `cargo clippy` passes (`moon run :lint`).
