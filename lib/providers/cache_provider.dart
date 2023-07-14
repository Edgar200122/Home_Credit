import 'package:app_p_10/providers/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheProvider extends ChangeNotifier {
  Future<void> clearCache(BuildContext context) async {
    var cacheManager = DefaultCacheManager();

    await cacheManager.emptyCache();
    notifyListeners();

    // // Restart the app
    // restartApp();
  }

  void takeCurrencySettings(String newCurrency) {
    Shared.prefs.setString('currency', newCurrency);
  }
}
