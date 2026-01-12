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

## Building

### Standard Compile (Dev)

To simply compile the WASM binary for development or testing compilation, use moon:

```sh
moon run :build-wasm
```

This will produce a binary at `target/wasm32-wasip1/release/flutter_tool.wasm`. Note that this binary is not optimized or stripped.

### Release Build

To produce the final optimized artifact, run the build script:

```sh
bash build-wasm.sh flutter_tool
```

The output WASM file will be located in `target/wasm32-wasip1/flutter_tool.wasm`.

**⚠️ Important Note on Paths**: The `build-wasm.sh` script currently expects `wasm-opt` and `wasm-strip` to be located in specific directories:
- `~/Dev/web-assembly-binaryen/bin/`
- `~/Dev/web-assembly-wabt/bin/`

You **must** edit the script to point to your installation paths or ensure your environment matches these expectations before running the script.

## Testing

The project uses `proto_pdk_test_utils` for integration testing.

### Running Tests

```sh
moon run :test
# or
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
3.  Build the optimized WASM binary using `build-wasm.sh`.
4.  Commit and push changes.
