import 'package:hive_flutter/hive_flutter.dart';
import 'package:safecheck_techno/core/utils/logger.dart';

class HiveStorage {
  static const String _defaultBoxName = 'safecheck_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_defaultBoxName);
    AppLogger.info('Hive Initialized successfully');
  }

  static Box get _box => Hive.box(_defaultBoxName);

  static Future<void> put(String key, dynamic value) async {
    await _box.put(key, value);
  }

  static dynamic get(String key, {dynamic defaultValue}) {
    return _box.get(key, defaultValue: defaultValue);
  }

  static Future<void> delete(String key) async {
    await _box.delete(key);
  }

  static Future<void> clearAll() async {
    await _box.clear();
  }
}
