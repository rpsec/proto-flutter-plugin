# Gemini Context: Proto Flutter Plugin

This project is a [proto](https://moonrepo.dev/proto) WASM plugin for managing the [Flutter SDK](https://flutter.dev/).

## Project Overview

- **Purpose**: Automates the installation, version detection, and management of the Flutter SDK using `proto`.
- **Key Technologies**:
  - **Rust**: Core logic implementation.
  - **WebAssembly (WASM)**: The plugin is compiled to WASM (`wasm32-wasip1`) for execution by `proto`.
  - **Extism PDK / Proto PDK**: Frameworks for building `proto` plugins.
  - **moon**: Task runner for development workflows.
- **Architecture**:
  - `src/lib.rs`: Entry point and module declarations.
  - `src/proto.rs`: Implementation of `proto_pdk` functions (e.g., `register_tool`, `load_versions`, `download_prebuilt`, `detect_version_files`).
  - `src/config.rs`: Defines the plugin configuration (e.g., `base-url` for custom mirrors).
  - `src/flutter_dist.rs`: Data models for parsing Flutter distribution JSON from Google's infrastructure.
- **Features**:
  - Version management (install/uninstall).
  - Alias support (`stable`, `beta`, `latest`).
  - Automatic version detection from `pubspec.yaml` environment constraints.
  - Support for macOS (x64, arm64), Linux (x64), and Windows (x64).

## Building and Running

The project uses [moon](https://moonrepo.dev) as a task runner.

### Key Commands

- **Build WASM**: `moon run :build-wasm`
  - Alternative: `./build-wasm.sh flutter_tool` (optimized release build).
- **Run Tests**: `moon run :test`
  - Uses `proto_pdk_test_utils` to run integration tests against the compiled WASM.
- **Linting**: `moon run :lint` (runs `cargo clippy`).
- **Formatting**: `moon run :format` (runs `cargo fmt`).
- **All Checks**: `moon run :check` (runs format-check, lint, and test).

## Development Conventions

- **WASM Target**: Always compile for `wasm32-wasip1`.
- **Proto Version**: Requires `proto` v0.47.0 or higher.
- **Version Detection**: The plugin prioritizes `pubspec.yaml` for automatic version detection.
- **Limitations**:
  - Does not support `flutter channel` command (use `proto install` instead).
  - Does not support `flutter upgrade/downgrade` (managed via `proto`).
  - Windows support currently forces `.tar.xz` or `.zip` based on platform defaults.
- **Testing**: Integration tests are located in `tests/` and use a sandbox environment provided by `proto_pdk_test_utils`.
- **Hooks**: A git pre-push hook is configured (via `moon sync hooks`) to run linting and tests.

## Key Files

- `Cargo.toml`: Project dependencies and WASM build configuration.
- `src/proto.rs`: The "brain" of the plugin, handling all `proto` lifecycle hooks.
- `src/config.rs`: Configuration schema for the plugin.
- `moon.yml`: Task definitions for the project.
- `docs/setup.md` & `docs/development.md`: Detailed guides for users and contributors.
