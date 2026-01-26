# AGENTS.md

This file contains instructions and context for AI agents (and humans) working on this repository.

## Project Structure

- `src/`: Source code for the Rust plugin.
- `build-wasm.sh`: Script to build the WASM plugin.
- `Cargo.toml`: Rust project configuration.
- `.moon/`: moon repository configuration directory.
- `moon.yml`: Project-level moon task definitions.
- `.prototools`: Proto tool versions configuration.

## Build Requirements

The project compiles to WASM using `cargo`.

### Development Build
For development purposes (running tests, quick iteration), use the moon task:
- `moon run :build-wasm` - Builds the WASM plugin using `cargo build --target wasm32-wasip1 --release`.

### Release Build (Optimized)
For release, the `build-wasm.sh` script performs additional optimization steps that require external tools:

- `cargo` with `wasm32-wasip1` target.
- `wasm-opt` from [Binaryen](https://github.com/WebAssembly/binaryen).
- `wasm-strip` from [WABT](https://github.com/WebAssembly/wabt).

**Important:** The `build-wasm.sh` script currently has **hardcoded paths** for `wasm-opt` and `wasm-strip`:
- `~/Dev/web-assembly-binaryen/bin/wasm-opt`
- `~/Dev/web-assembly-wabt/bin/wasm-strip`

If you need to run this script, you must either:
1.  Update the script to match your environment.
2.  Symlink your tools to these locations.

### moon Tasks

This repository is set up as a moon repository with the following tasks:

- `moon run :format` - Format code using cargo fmt
- `moon run :format-check` - Check code formatting
- `moon run :lint` - Lint code using cargo clippy
- `moon run :build` - Build the project for development (standard target)
- `moon run :build-wasm` - Build the WASM plugin (wasm32-wasip1 target)
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

Integration tests using `proto_pdk_test_utils` often require a mock proto environment.
- Specifically, `installs_tool` test may fail if `~/.proto/bin/proto-shim` does not exist. A dummy executable should be created there to simulate the shim.

## Known Issues / Context

- **Upgrades**: The plugin does not support `flutter upgrade`. Version management should be done via `proto`.

## Code Style

- Follow standard Rust formatting (`cargo fmt` or `moon run :format`).
- Ensure `cargo clippy` passes (`moon run :lint`).
