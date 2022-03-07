import 'package:hive/hive.dart';

class Cache {
  final actionplan = 'plano-de-acao';
  Cache() {
    Hive.openBox(actionplan);
  }

  addToCache(String key, Map<String, dynamic> json) {
    Hive.box(actionplan).put(key, json);
  }

  Map<String, dynamic> getFromCache(String key) {
    return Hive.box(actionplan).get(key);
  }
}
