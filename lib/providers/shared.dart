import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static late SharedPreferences prefs;
  static Future<void> initShared() async {
    prefs = await SharedPreferences.getInstance();
  }
}
