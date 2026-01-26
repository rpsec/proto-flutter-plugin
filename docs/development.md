# Development Guide

This guide covers how to build and test the Flutter proto plugin.

## Prerequisites

- **Rust**: Ensure you have a recent version of Rust installed.
- **WASM Target**: Install the `wasm32-wasip1` target:
  ```sh
  rustup target add wasm32-wasip1
  ```
- **Binaryen**: Required for `wasm-opt`. Download from [Binaryen releases](https://github.com/WebAssembly/binaryen/releases).
- **WABT**: Required for `wasm-strip`. Download from [WABT releases](https://github.com/WebAssembly/wabt/releases).

**Note on Paths**: The `build-wasm.sh` script currently expects `wasm-opt` and `wasm-strip` to be located in specific directories (`~/Dev/web-assembly-binaryen/bin/` and `~/Dev/web-assembly-wabt/bin/`). You may need to edit the script to point to your installation paths.

## Building

### Development Build

For routine development and testing, you can use `moon` to build the WASM binary. This runs `cargo build` but does not perform the extra optimization steps (like `wasm-opt` and `wasm-strip`).

```sh
moon run :build-wasm
```

### Release Build (Optimized)

To create an optimized and stripped binary for release, run the `build-wasm.sh` script:

```sh
bash build-wasm.sh flutter_tool
```

The output WASM file will be located in `target/wasm32-wasip1/flutter_tool.wasm`.

> **Warning:** As mentioned above, `build-wasm.sh` has hardcoded paths. Ensure you have adjusted them or set up your environment to match.

## Testing

The project uses `proto_pdk_test_utils` for integration testing.

### Running Tests

```sh
cargo test
```

### Troubleshooting Tests

If you encounter failures in tests like `installs_tool`, it might be due to a missing mock shim. The test harness often expects `~/.proto/bin/proto-shim` to exist. You can create a dummy file to satisfy this requirement:

```sh
mkdir -p ~/.proto/bin
touch ~/.proto/bin/proto-shim
chmod +x ~/.proto/bin/proto-shim
```

## Release Process

1.  Update the version in `Cargo.toml`.
2.  Update `CHANGELOG.md`.
3.  Build the WASM binary.
4.  Commit and push changes.
