[![Built with Jules](https://img.shields.io/badge/Built%20with-Jules-715cd7?link=https://jules.google)](https://jules.google)


# Flutter plugin

[Flutter](https://flutter.dev/) WASM plugin for [proto](https://github.com/moonrepo/proto).

## Documentation

- [Setup & Configuration](./docs/setup.md)
- [Development Guide](./docs/development.md)
- [Contributing](./CONTRIBUTING.md)

## Overview

This plugin allows you to manage Flutter SDK versions using `proto`.

### Features

- **Version Management**: Install specific versions of Flutter.
- **Aliases**: Supports `stable`, `beta`, and `latest` aliases.
- **Version Detection**: Detects required Flutter version from `pubspec.yaml`.
- **Pre-built Binaries**: Downloads pre-built Flutter SDKs from Google's infrastructure (or a configured mirror).

### Limitations

- **Channel Switching**: The plugin does not support the native `flutter channel` command. Use `proto` to install different channel versions (e.g., `proto install flutter beta`).
- **Self-Upgrades**: `flutter upgrade` and `flutter downgrade` are not supported. Version control is fully managed by `proto`.
- **Platform Support**: While it aims to support major platforms, there are known issues with archive formats on Windows in the current implementation (forces `.tar.xz`).

## Quick Start

1.  **Install plugin**:
    ```sh
    proto plugin add flutter github://KonstantinKai/proto-flutter-plugin
    ```

2.  **Install Flutter**:
    ```sh
    proto install flutter stable
    ```

3.  **Use Flutter**:
    ```sh
    flutter --version
    ```

## Development

This repository is set up as a [moon](https://moonrepo.dev) repository for task management.

### Available Tasks

- **Format code**: `moon run :format`
- **Check formatting**: `moon run :format-check`
- **Lint code**: `moon run :lint`
- **Build (dev)**: `moon run :build`
- **Build WASM**: `moon run :build-wasm`
- **Run tests**: `moon run :test`
- **Run all checks**: `moon run :check` (format-check + lint + test)
- **Clean**: `moon run :clean`

### Requirements

- [proto](https://moonrepo.dev/proto) - Tool version manager
- [moon](https://moonrepo.dev) - Task runner and monorepo management
- Rust toolchain (managed via proto, specified in `.prototools`)

The project uses proto to manage the Rust toolchain version automatically.

### VCS Hooks

The repository is configured with a **pre-push hook** that automatically runs linting and tests before pushing to ensure code quality. To set up the hook, run:

```sh
moon sync hooks
```

This will install a git pre-push hook that runs:
- `moon run :lint` - Lint the code with clippy
- `moon run :test` - Run all tests

The push will be blocked if either check fails.
