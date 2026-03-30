# Contributing to Flutter Tool for proto

Thank you for your interest in contributing to the Flutter plugin for proto! We welcome contributions from the community.

## Getting Started

To get started with development, please read our [Development Guide](./docs/development.md). It covers:
- Prerequisites (Rust, WASM targets, etc.)
- How to build the project
- How to run tests

## Reporting Issues

If you find a bug or have a feature request, please open an issue on the GitHub repository. When reporting a bug, please include:
- Your operating system.
- The version of `proto` you are using.
- The version of the Flutter plugin.
- Steps to reproduce the issue.
- Relevant error logs.

## Submitting Pull Requests

1.  **Fork the repository** and create a new branch for your feature or fix.
2.  **Make your changes**. Ensure your code follows the existing style and conventions.
3.  **Run tests**. Run `moon run :test` (or `cargo test`) to ensure all tests pass.
4.  **Format and Lint**. Run `moon run :format` (or `cargo fmt`) and `moon run :lint` (or `cargo clippy`) to check for code style issues.
5.  **Submit a Pull Request**. Provide a clear description of your changes and reference any related issues.

> **Note:** See the [Development Guide](./docs/development.md) for a comprehensive breakdown of alternative `cargo` commands in restricted environments missing `moon`.

## Code of Conduct

Please be respectful and considerate of others when contributing to this project.
