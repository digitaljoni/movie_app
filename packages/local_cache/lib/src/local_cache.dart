import 'package:hive/hive.dart';

/// Interface which is used to persist and retrieve state changes.
abstract class Storage {
  /// Returns value for key
  dynamic read(String key);

  /// Persists key value pair
  Future<void> write(String key, dynamic value);
}

/// {@template local_cache}
/// Simple class to store data to local hive
/// can be improved later on with addition of platform checking,
/// build constructor, and locking
/// {@endtemplate}
class LocalCache implements Storage {
  /// {@macro local_cache}
  LocalCache(this._box);

  final Box<dynamic> _box;

  @override
  dynamic read(String key) => _box.get(key);

  @override
  Future<void> write(String key, dynamic value) async {
    return _box.put(key, value);
  }
}
