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

**Important Note on Paths**: The `build-wasm.sh` script relies on `wasm-opt` and `wasm-strip` being available at **hardcoded paths**:
- `~/Dev/web-assembly-binaryen/bin/wasm-opt`
- `~/Dev/web-assembly-wabt/bin/wasm-strip`

If your tools are installed elsewhere (or in your system PATH), **you must edit `build-wasm.sh`** to match your environment before running it.

## Building

### Development Build

For local development and testing, you can use `moon` to build the WASM binary without optimizations. This does not require Binaryen or WABT.

```sh
moon run :build-wasm
```

The artifact will be at `target/wasm32-wasip1/release/flutter_tool.wasm`.

### Release Build

To create a production-ready, optimized, and stripped WASM binary, use the provided script:

```sh
bash build-wasm.sh flutter_tool
```

The output WASM file will be located in `target/wasm32-wasip1/flutter_tool.wasm`.

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

## Architecture

### Release Fetching Logic

The plugin fetches Flutter release metadata from Google's infrastructure to determine available versions and download URLs.

1.  **OS Detection**: The plugin detects the host operating system (Linux, macOS, Windows).
2.  **Metadata Fetching**: It fetches `releases_{os}.json` from the base URL (default: `https://storage.googleapis.com/flutter_infra_release/releases`).
    -   Example: `https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json`
3.  **Archive Selection**: It parses the JSON to find the requested version (or `latest`/`stable`/`beta`).
    -   It uses the `archive` path specified in the JSON metadata.
    -   This ensures the correct archive format (e.g., `.zip` for Windows/macOS, `.tar.xz` for Linux) and architecture (e.g., `x64` vs `arm64`) is used.

## Release Process

1.  Update the version in `Cargo.toml`.
2.  Update `CHANGELOG.md`.
3.  Build the WASM binary.
4.  Commit and push changes.
