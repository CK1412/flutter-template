import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    printTime: true,
  ),
  level: kReleaseMode ? Level.off : Level.trace,
);
