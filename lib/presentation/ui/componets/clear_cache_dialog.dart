import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:app_p_10/providers/cache_provider.dart';
import 'package:app_p_10/providers/onboarding_provider.dart';
import 'package:app_p_10/providers/settings_provider.dart';
import 'package:app_p_10/providers/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClearCacheDialog extends StatelessWidget {
  const ClearCacheDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var cacheProvider = Provider.of<CacheProvider>(context, listen: false);
    var onboardingprovider = Provider.of<OnboardingProvider>(context);
    final imageProvider = Provider.of<SettingsProvider>(context);
    return AlertDialog(
      content: SizedBox(
        height: 195,
        width: 312,
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              clearCashDialogicon,
              width: 18,
            ),
            const SizedBox(
              height: 10,
            ),
            const AppTexts(
              title: "Are you sure?",
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 10),
            const AppTexts(
              title: "All data will be lost",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: dilogTextColor,
            ),
            const SizedBox(height: 34),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    cacheProvider.clearCache(context);
                    imageProvider.clearCache();
                    Shared.prefs.clear();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
                    onboardingprovider.setCurrentPage(0);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 39,
                    width: 88,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border: Border.all(color: Colors.white)),
                    child: const AppTexts(
                      title: "Ok",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 39,
                    width: 88,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border: Border.all(color: Colors.red)),
                    child: const AppTexts(
                      title: "Cancel",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }
}
