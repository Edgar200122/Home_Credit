import 'dart:io';

import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_bar.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:app_p_10/presentation/ui/componets/credit_container.dart';
import 'package:app_p_10/presentation/ui/componets/home_page_items.dart';
import 'package:app_p_10/providers/settings_provider.dart';
import 'package:app_p_10/providers/text_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<SettingsProvider>(context);
    final textProvider = Provider.of<TextProvider>(context);
    textProvider.loadTypedTextFromSharedPreferences();
    Future<bool> onWillPop() async {
      return false;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: containerTextColor,
          automaticallyImplyLeading: false,
          title: CustomAppBar(
            title: "Home",
            widgetTwo: Image.asset(
              settingsIcon,
              height: 19,
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    imageProvider.imageUrl != null &&
                            imageProvider.imageUrl!.isNotEmpty
                        ? SizedBox(
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                File(imageProvider.imageUrl!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: imageBackgroundColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset(
                                defaultUserImage,
                              ),
                            ),
                          ),
                    const SizedBox(
                      width: 23,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTexts(
                          title: "Welcome",
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                        AppTexts(
                          title: textProvider.typedText != ""
                              ? textProvider.typedText
                              : "User Name",
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CreditContainer(),
              ),
              const SizedBox(
                height: 23,
              ),
              const HomePageItems(),
            ],
          ),
        ),
      ),
    );
  }
}
