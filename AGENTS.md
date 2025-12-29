# AGENTS.md

This file contains instructions and context for AI agents (and humans) working on this repository.

## Project Structure

- `src/`: Source code for the Rust plugin.
- `build-wasm.sh`: Script to build the WASM plugin.
- `Cargo.toml`: Rust project configuration.

## Build Requirements

The project compiles to WASM using `cargo`. The `build-wasm.sh` script performs additional optimization steps that require external tools:

- `cargo` with `wasm32-wasip1` target.
- `wasm-opt` from [Binaryen](https://github.com/WebAssembly/binaryen).
- `wasm-strip` from [WABT](https://github.com/WebAssembly/wabt).

The script assumes these tools are located in `~/Dev/web-assembly-binaryen/bin/` and `~/Dev/web-assembly-wabt/bin/`. You may need to adjust the script or your environment to match these paths, or look for them in the system path.

## Testing

Integration tests using `proto_pdk_test_utils` often require a mock proto environment.
- Specifically, `installs_tool` test may fail if `~/.proto/bin/proto-shim` does not exist. A dummy executable should be created there to simulate the shim.

## Known Issues / Context

- **File Extensions**: The plugin currently constructs download URLs assuming `.tar.xz` for all platforms in `src/proto.rs`.
  - *Context*: Flutter SDK archives typically use `.zip` for Windows and macOS, and `.tar.xz` for Linux.
  - The `fetch_dist` function retrieves a JSON with an `archive` field that contains the correct filename, but `download_prebuilt` ignores it and reconstructs the URL.
- **Upgrades**: The plugin does not support `flutter upgrade`. Version management should be done via `proto`.

## Code Style

- Follow standard Rust formatting (`cargo fmt`).
- Ensure `cargo clippy` passes.
