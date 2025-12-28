## 0.3.0

#### Fixes

- Fixed Flutter installation by using the `archive` field from releases JSON to get the correct download URL
- Linux now correctly downloads `.tar.xz` archives instead of `.zip`
- Ensures proper archive format for all platforms (Linux: `.tar.xz`, Windows: `.zip`, macOS: `.zip`)

## 0.2.0

#### Updates

- Respects arch and os for versions retrieving (filters out unsupported versions)
- Shows earlier versions with `v` prefix for supported platforms
- Shows error for unsupported version while installing
- More tests added

## 0.1.0

#### 🎉 Release

- Initial release
