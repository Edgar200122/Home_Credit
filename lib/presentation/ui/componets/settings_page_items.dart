import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:app_p_10/presentation/ui/componets/clear_cache_dialog.dart';
import 'package:app_p_10/presentation/ui/componets/custom_dialog.dart';
import 'package:app_p_10/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPageItems extends StatelessWidget {
  const SettingsPageItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = context.watch<SettingsProvider>();

    final List<Map<String, dynamic>> rowList = [
      {
        'image': notificationsicon,
        'title': 'Notifications',
        'onTap': () {},
        'widget': SizedBox(
          height: 40,
          child: Switch(
            activeThumbImage: const AssetImage(switchIcon),
            inactiveThumbImage: const AssetImage(inactiveSwitchIcon),
            activeTrackColor: Colors.white,
            activeColor: Colors.red,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
            value: settingsProvider.enableNotifications,
            onChanged: (bool value) {
              if (value) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(settingsProvider: settingsProvider);
                  },
                );
              } else {
                settingsProvider.enableNotifications = false;
              }
            },
          ),
        ),
      },
      {
        'image': privacyPolicyIcon,
        'title': 'Privacy Policy',
        'onTap': () {
          Navigator.pushNamed(context, 'privacyPolicy_page');
        },
      },
      {
        'image': termsOfUseIcon,
        'title': 'Terms of use',
        'onTap': () {
          Navigator.pushNamed(context, 'Termsofuse_page');
        },
      },
      {
        'image': shareIcon,
        'title': 'Share app',
        'onTap': () {
          settingsProvider.shareApp();
        },
      },
      {
        'image': ratePppIcon,
        'title': 'Rate app',
        'onTap': () {
          settingsProvider.rateUs;
        },
      },
      {
        'image': clearCashicon,
        'title': 'Clear cash',
        'onTap': () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ClearCacheDialog();
            },
          );
        },
        'color': imageBackgroundColor,
      },
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.7,
        width: 382,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: settingscontainerColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 11),
          child: Column(
            children: List.generate(rowList.length, (index) {
              final row = rowList[index];

              return RowItems(
                image: row['image'],
                title: row['title'],
                onTap: row['onTap'],
                color: row['color'],
                widget: row['widget'],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class RowItems extends StatelessWidget {
  const RowItems({
    Key? key,
    required this.image,
    required this.title,
    this.widget,
    this.color,
    required this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final Widget? widget;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: color ?? containerTextColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(image),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            AppTexts(
              title: title,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            widget ??
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: containerTextColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(
                      arrowRight,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
