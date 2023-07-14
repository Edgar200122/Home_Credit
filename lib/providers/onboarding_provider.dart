import 'package:app_p_10/presentation/ui/componets/onboardin_list_screens.dart';
import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get currentPage => _currentPage;
  PageController get pageController => _pageController;

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void nextPage(BuildContext context) {
    if (_currentPage < onboardingPages.length - 1) {
      _currentPage += 1;
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    } else {
      Navigator.pushNamed(context, "home_page");
    }
  }
}
