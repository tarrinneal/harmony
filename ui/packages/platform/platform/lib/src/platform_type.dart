import 'package:flutter/foundation.dart';

enum PlatformType {
  android,
  iOS,
  fuchsia,
  windows,
  linux,
  macOS,
  web,
}

/// A utility class used to provide the platform for flutter applications.
/// Use this for platform detection instead of the standard flutter primitives
/// as this provides a way to inject feature detection (which is particularly
/// useful for tests.)
///
/// This should not be used to decide layout but rather to sanity check the
/// runtime capabilities of the platform the app is running on by platform.
class ClientType {
  static PlatformType get platform {
    if (kIsWeb) return PlatformType.web;
    return defaultTargetPlatform.getPlatformType();
  }
}

extension on TargetPlatform {
  PlatformType getPlatformType() {
    switch (this) {
      case TargetPlatform.android:
        return PlatformType.android;
      case TargetPlatform.fuchsia:
        return PlatformType.fuchsia;
      case TargetPlatform.iOS:
        return PlatformType.iOS;
      case TargetPlatform.linux:
        return PlatformType.linux;
      case TargetPlatform.macOS:
        return PlatformType.macOS;
      case TargetPlatform.windows:
        return PlatformType.windows;
    }
  }
}
