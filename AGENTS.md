# AGENTS.md

This file contains instructions and context for AI agents (and humans) working on this repository.

## Project Structure

- `src/`: Source code for the Rust plugin.
- `build-wasm.sh`: Script to build, optimize, and strip the WASM plugin for release.
- `Cargo.toml`: Rust project configuration.
- `.moon/`: moon repository configuration directory.
- `moon.yml`: Project-level moon task definitions.
- `.prototools`: Proto tool versions configuration.

## Build Requirements

The project compiles to WASM using `cargo`.

### Development Build
Run `moon run :build-wasm` to build the raw WASM binary. This is sufficient for verifying that the code compiles.

### Release Build
The `build-wasm.sh` script performs additional optimization steps that require external tools:

- `cargo` with `wasm32-wasip1` target.
- `wasm-opt` from [Binaryen](https://github.com/WebAssembly/binaryen).
- `wasm-strip` from [WABT](https://github.com/WebAssembly/wabt).

**Gotcha:** The script assumes these tools are located in `~/Dev/web-assembly-binaryen/bin/` and `~/Dev/web-assembly-wabt/bin/`. You may need to adjust the script or your environment to match these paths, or look for them in the system path.

## Configuration

The plugin configuration is defined in `src/config.rs`.
- `base_url`: (Default: `https://storage.googleapis.com/flutter_infra_release/releases`) URL to download Flutter SDKs from.

## moon Tasks

This repository is set up as a moon repository with the following tasks:

- `moon run :format` - Format code using cargo fmt
- `moon run :format-check` - Check code formatting
- `moon run :lint` - Lint code using cargo clippy
- `moon run :build` - Build the project for development
- `moon run :build-wasm` - Build the raw WASM plugin (requires wasm32-wasip1 target)
- `moon run :test` - Run all tests
- `moon run :check` - Run format-check, lint, and test
- `moon run :clean` - Clean build artifacts

## proto Integration

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
- **Windows Archives**: There are known issues with archive formats on Windows in the current implementation (forces `.tar.xz`), though this may vary by specific implementation version.

## Code Style

- Follow standard Rust formatting (`cargo fmt` or `moon run :format`).
- Ensure `cargo clippy` passes (`moon run :lint`).
