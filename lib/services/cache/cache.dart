import 'package:hive/hive.dart';

class Cache {
  var box = Hive.box('plano-de-acao');

  addToCache(String key, Map<String, dynamic> json) {
    box.put(key, json);
  }

  Map<String, dynamic> getFromCache(String key) {
    return box.get(key);
  }
}
