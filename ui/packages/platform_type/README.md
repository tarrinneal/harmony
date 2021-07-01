# platform_type

Provides feature detection based off of platform (including web). This is a
wrapper over kIsWeb and defaultTargetPlatform to allow for better testing and
consisten use throughout the app.

## Getting Started

Check the PlatformType with this snippet:
```dart
ClientType.platform == PlatformType.andorid;
```