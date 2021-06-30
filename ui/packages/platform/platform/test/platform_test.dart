import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:platform_type/platform_type.dart';

void main() {
  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  test('ClientType.platform returns PlatformType.android', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    expect(ClientType.platform, PlatformType.android);
  });

  test('ClientType.platform returns PlatformType.iOS', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    expect(ClientType.platform, PlatformType.iOS);
  });

  test('ClientType.platform returns PlatformType.fuchsia', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
    expect(ClientType.platform, PlatformType.fuchsia);
  });

  test('ClientType.platform returns PlatformType.windows', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    expect(ClientType.platform, PlatformType.windows);
  });

  test('ClientType.platform returns PlatformType.linux', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    expect(ClientType.platform, PlatformType.linux);
  });

  test('ClientType.platform returns PlatformType.macOS', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    expect(ClientType.platform, PlatformType.android);
  });
}

void setTargetPlatform(TargetPlatform platform) {
    debugDefaultTargetPlatformOverride = platform;
}
