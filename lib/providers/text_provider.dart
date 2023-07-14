import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextProvider extends ChangeNotifier {
  String _typedText = '';

  String get typedText => _typedText;

  void setTypedText(String text) {
    _typedText = text;
    saveTypedTextToSharedPreferences(text);
    notifyListeners();
  }

  Future<void> saveTypedTextToSharedPreferences(String text) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('typed_text', text);
  }

  Future<void> loadTypedTextFromSharedPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    _typedText = preferences.getString('typed_text') ?? '';
    notifyListeners();
  }
}
