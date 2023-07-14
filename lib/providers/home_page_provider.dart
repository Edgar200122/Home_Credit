import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  late String currentImage;
  late bool isInitialImage;
  Color? textColor;
  final String initialImage;
  final String alternateImage;

  HomePageProvider({
    required this.initialImage,
    required this.alternateImage,
    required Color? colorText,
  }) {
    currentImage = initialImage;
    isInitialImage = true;
    textColor = colorText;
  }

  void changeImage() {
    if (isInitialImage) {
      currentImage = alternateImage;
      textColor = textColor;
    } else {
      currentImage = initialImage;
      textColor = textColor;
    }
    isInitialImage = !isInitialImage;

    notifyListeners();
  }
}
