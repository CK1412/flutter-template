import 'dart:io';
import 'dart:math';

import '../exceptions/error_handler.dart';

/// [FileUtils] support mobile platform
class FileUtils {
  FileUtils._();

  static final ErrorHandler _errorHandler = ErrorHandler();

  static double convertBytesToAnotherUnit(int bytes, FileSizeUnit unit) {
    return switch (unit) {
      FileSizeUnit.byte => bytes.toDouble(),
      FileSizeUnit.kilobyte => bytes / 1024,
      FileSizeUnit.megabyte => bytes / (pow(1024, 2)),
      FileSizeUnit.gigabyte => bytes / (pow(1024, 3)),
      FileSizeUnit.terabyte => bytes / (pow(1024, 4)),
    };
  }

  static double getFilesSize(
    List<File> files, {
    FileSizeUnit unit = FileSizeUnit.megabyte,
  }) {
    int sizeInBytes = 0;

    for (final file in files) {
      try {
        sizeInBytes += file.lengthSync();
      } catch (e) {
        _errorHandler.logError('getFilesSize', error: e);
      }
    }
    return convertBytesToAnotherUnit(sizeInBytes, unit);
  }
}

enum FileSizeUnit {
  byte,
  kilobyte,
  megabyte,
  gigabyte,
  terabyte,
}

extension FileSizeUnitExtension on FileSizeUnit {
  String get symbol {
    return switch (this) {
      FileSizeUnit.byte => 'B',
      FileSizeUnit.kilobyte => 'KB',
      FileSizeUnit.megabyte => 'MB',
      FileSizeUnit.gigabyte => 'GB',
      FileSizeUnit.terabyte => 'TB',
    };
  }
}
