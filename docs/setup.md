# Setup and Configuration

## Installation

Add the plugin to your `.prototools` file:

```toml
[plugins]
flutter = "github://KonstantinKai/proto-flutter-plugin"
```

Or install via command line:

```sh
proto plugin add flutter github://KonstantinKai/proto-flutter-plugin
```

## Configuration

You can configure the Flutter plugin in `.prototools`.

### `base-url`

Set a custom base URL for downloading Flutter SDK archives and fetching version information. This is useful for mirrors or corporate repositories.

**Type**: String
**Default**: `https://storage.googleapis.com/flutter_infra_release/releases`

```toml
[tools.flutter]
base-url = "https://your-mirror.example.com/flutter/releases"
```

## Version Detection

The plugin can detect the Flutter version from `pubspec.yaml` if a `flutter` constraint is defined in the `environment` section.

Example `pubspec.yaml`:

```yaml
environment:
  sdk: ">=3.0.0 <4.0.0"
  flutter: ">=3.10.0"
```

When you run `proto install` or `proto use` in a directory with this file, proto will attempt to use a version matching the constraint.

## Limitations

- **Channel Switching**: Built-in channel switching (`flutter channel`) is not supported. Use `proto install flutter beta` to install a beta version.
- **Self-Upgrade**: `flutter upgrade` and `flutter downgrade` commands are disabled/not supported. Use `proto install flutter <version>` to manage versions.
- **Canary/Nightly**: Canary or nightly builds are not supported. Only `stable` and `beta` channels are fully supported.
