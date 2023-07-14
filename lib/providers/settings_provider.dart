import 'dart:io';

import 'package:app_p_10/providers/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SettingsProvider with ChangeNotifier {
  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  bool _enableNotifications = true;
  bool get enableNotifications => _enableNotifications;

  set enableNotifications(bool value) {
    _enableNotifications = value;
    if (value) {
      enableNotificationsPlugin();
    } else {
      disableNotificationsPlugin();
    }
    notifyListeners();
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeNotificationsPlugin() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    try {
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    } catch (e) {
      // Handle initialization errors
      if (kDebugMode) {
        print('Failed to initialize notifications plugin: $e');
      }
    }
  }

  void enableNotificationsPlugin() {
    // Initialize and configure notification settings
    initializeNotificationsPlugin();

    // Add your notification configuration code here
    // For example, you can schedule and display notifications
    // based on your app's requirements
  }

  void disableNotificationsPlugin() {
    flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> selectImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageUrl = pickedFile.path;
      notifyListeners();
      await saveImageUrlToSharedPreferences(_imageUrl);
    }
  }

  Future<void> selectImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _imageUrl = pickedFile.path;
      notifyListeners();
      await saveImageUrlToSharedPreferences(_imageUrl);
    }
  }

  Future<void> saveImageUrlToSharedPreferences(String? imageUrl) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('image_url', imageUrl ?? '');
  }

  Future<void> loadImageUrlFromSharedPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    _imageUrl = preferences.getString('image_url') ?? '';
    notifyListeners();
  }

  void saveFirstJoinHomePage() {
    Shared.prefs.setBool('homeOrOnBord', true);
  }

  Future<void> clearCache() async {
    if (_imageUrl != null) {
      try {
        await File(_imageUrl!).delete();
      } catch (e) {
        if (kDebugMode) {
          print('Failed to delete image file: $e');
        }
      }
    }

    _imageUrl = null;
    await saveImageUrlToSharedPreferences(null);
    notifyListeners();
  }

  Future<void> rateUs() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
      // inAppReview.openStoreListing(appStoreId: '...', microsoftStoreId: '...');
      notifyListeners();
    }
  }

  void shareApp() async {
    try {
      Share.share(
        "https://appdynamiclinka.page.link/76UZ",
        subject: 'Look what I made!',
      );
    } catch (e) {
      if (kDebugMode) {
        print('Failed to share app: $e');
      }
    }
  }
}
