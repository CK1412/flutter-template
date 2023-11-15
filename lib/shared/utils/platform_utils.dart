import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformUtils {
  PlatformUtils._();

  static bool get isMobileDevice =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  static bool get isDesktopDevice =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

  static bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;

  static bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

  static bool get isIOSDevice => !kIsWeb && Platform.isIOS;

  static bool get isAndroidDevice => !kIsWeb && Platform.isAndroid;
}
