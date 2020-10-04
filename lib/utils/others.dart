import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class Utils {
  static final Utils _instance = Utils();
  static Utils getInstance() => _instance;

  Future<Map<String, dynamic>> loadJson(String path, String fileName) async {
    String data = await rootBundle.loadString('$path/$fileName');
    final map = json.decode(data);
    return map;
  }
}

class DevLog {
  static final DevLog _instance = DevLog();
  static DevLog getLogger() => _instance;
  static Logger _logger = Logger(printer: PrettyPrinter());

  void logError(String message, [dynamic error]) {
    _logger.e(message, error);
  }

  void logWarning(String message, [dynamic error]) {
    _logger.w(message, error);
  }

  void logInfo(String message) {
    _logger.i(message);
  }
}

extension RawValueExtension on Object {
  String get varName => toString().split('.').last;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
