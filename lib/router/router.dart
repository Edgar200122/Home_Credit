import 'package:app_p_10/presentation/ui/onboarding/onboarding_page.dart';
import 'package:app_p_10/presentation/ui/onboarding/splash_screen.dart';
import 'package:app_p_10/presentation/ui/screens/asked_questions.dart';
import 'package:app_p_10/presentation/ui/screens/calculator_screen.dart';
import 'package:app_p_10/presentation/ui/screens/home_screen.dart';
import 'package:app_p_10/presentation/ui/screens/no_internet_scree.dart';
import 'package:app_p_10/presentation/ui/screens/offerwall_screen.dart';
import 'package:app_p_10/presentation/ui/screens/privacy_policy_screen.dart';
import 'package:app_p_10/presentation/ui/screens/quiz_screen.dart';
import 'package:app_p_10/presentation/ui/screens/result_screen_quiz.dart';
import 'package:app_p_10/presentation/ui/screens/result_screen_test.dart';
import 'package:app_p_10/presentation/ui/screens/settings_screen.dart';
import 'package:app_p_10/presentation/ui/screens/terms_of_use.dart';
import 'package:app_p_10/presentation/ui/screens/test_screen.dart';
import 'package:app_p_10/presentation/ui/screens/webview_screen.dart';
import 'package:app_p_10/providers/shared.dart';

final routes = {
  "/": (context) {
    bool? homeOrOnBord = Shared.prefs.getBool('homeOrOnBord');
    if (homeOrOnBord == null) {
      Shared.prefs.setBool('homeOrOnBord', true);
      return const SplashScreen();
    } else {
      return const HomePage();
    }
  },
  "onboarding_one": (context) => const OnboardingPage(),
  "home_page": (context) => const HomePage(),
  "settings_page": (context) => const SettingsPage(),
  "privacyPolicy_page": (context) => const PrivacyPolicyPage(),
  "Termsofuse_page": (context) => const TermsOfUsePage(),
  "quiz_page": (context) => const QuizPage(),
  "test_page": (context) => const TestPage(),
  "result_page_quiz": (context) => const ResultPage(),
  "webview_page": (context) => const WebViewPage(),
  "result_spage_test": (context) => const ResultScreenTest(),
  "no_internet": (context) => const NoInternetScreen(),
  "faq_screen": (context) => const AskedQuestions(),
  "calculator_screen": (context) => const CalculatorPage(),
  "offerwall_screen": (context) => const OfferwallPage(),
};
