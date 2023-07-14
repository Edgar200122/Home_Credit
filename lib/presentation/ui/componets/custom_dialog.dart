import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:app_p_10/providers/settings_provider.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.settingsProvider,
  });

  final SettingsProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 145,
        width: 312,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const AppTexts(
              title: "Notification",
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 10),
            const AppTexts(
              title: "Click on allow to receive notifications",
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
                    Navigator.pop(context);
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
                      title: "Block",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    settingsProvider.enableNotifications = true;
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
                      title: "Allow",
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
