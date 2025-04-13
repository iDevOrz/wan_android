import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class StorageConfig {
  static late Directory tempDir;

  static Future init() async {
    tempDir = await getTemporaryDirectory();
  }

  @visibleForTesting
  static void testMock() {
    tempDir = Directory("mock");
  }
}
