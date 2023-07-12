import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import 'app_constants.dart';

class AppCacheManager{
  static dynamic getCachedData(String key) {
    GetStorage box = GetStorage();
    log('Response From Cache $key: ${box.read(key).toString()}');
    return box.read(key); // reading cache data
  }

  static renewCacheData(String key, dynamic data) {
    GetStorage box = GetStorage();

    int lastCachedTime = box.read('${AppConstants.timeCheckingKey}$key') ?? 0; // last caching time
    int currentTime = DateTime.now().millisecondsSinceEpoch; // getting current time
    int expiryTime = currentTime - lastCachedTime; // time difference between last caching time and current time

    if (expiryTime > (15 * 60 * 1000)) {
      try {
        box.write(key, data); // cache data
        log('key: $key , data : $data');
        box.write('${AppConstants.timeCheckingKey}$key', DateTime.now().millisecondsSinceEpoch);
      } catch (e) {
        log('caching error : ${e.toString()}');
      } // caching time
    }
  }
}