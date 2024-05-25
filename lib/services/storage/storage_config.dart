import 'dart:io';

import 'package:path_provider/path_provider.dart';

class StorageConfig {
  static late Directory tempDir;

  static Future init() async {
    tempDir = await getTemporaryDirectory();
  }
}
