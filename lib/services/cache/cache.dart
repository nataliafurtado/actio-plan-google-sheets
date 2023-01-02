import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Cache {
  final actionplan = 'plano-de-acao';
  Cache() {
    initHive();
  }

  initHive() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.openBox(actionplan);
  }

  addToCache(dynamic key, dynamic data) {
    Hive.box(actionplan).put(key, data);
  }

  removeCache(dynamic key) {
    Hive.box(actionplan).delete(key);
  }

  dynamic getFromCache(String key) {
    return Hive.box(actionplan).get(key);
  }
}
