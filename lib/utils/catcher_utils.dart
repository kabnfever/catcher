import 'dart:io';

class CatcherUtils {
  static Future<bool> isInternetConnectionAvailable(String host) async {
    try {
      final result = await InternetAddress.lookup(host);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } catch (_) {
      return Future.value(false);
    }
  }
}
