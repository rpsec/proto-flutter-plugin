# Flutter plugin

[Flutter](https://flutter.dev/) WASM plugin for [proto](https://github.com/moonrepo/proto).

## Documentation

- [Setup & Configuration](./docs/setup.md)
- [Development Guide](./docs/development.md)

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
