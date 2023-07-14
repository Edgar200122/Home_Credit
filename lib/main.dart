import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/providers/cache_provider.dart';
import 'package:app_p_10/providers/onboarding_provider.dart';
import 'package:app_p_10/providers/settings_provider.dart';
import 'package:app_p_10/providers/quiz_provider.dart';
import 'package:app_p_10/providers/shared.dart';
import 'package:app_p_10/providers/test_provider.dart';
import 'package:app_p_10/providers/text_provider.dart';
import 'package:app_p_10/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.initShared();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnboardingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              SettingsProvider()..loadImageUrlFromSharedPreferences(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuizProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TestProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TextProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CacheProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: appBackgroundColor,
          fontFamily: "Roboto",
        ),
        routes: routes,
      ),
    );
  }
}
