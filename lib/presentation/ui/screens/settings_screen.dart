import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/add_image.dart';
import 'package:app_p_10/presentation/ui/componets/app_bar.dart';
import 'package:app_p_10/presentation/ui/componets/settings_page_items.dart';
import 'package:app_p_10/presentation/ui/componets/textfield.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: containerTextColor,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          ontap: () {
            Navigator.pop(context, "home_page");
          },
          title: "Settings",
          widgetOne: Image.asset(
            arrowBack,
            height: 16,
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            currentFocus.unfocus();
          },
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 36,
                ),
                Center(
                  child: AddImage(),
                ),
                SizedBox(
                  height: 36,
                ),
                CustomTextField(),
                SizedBox(
                  height: 32,
                ),
                SettingsPageItems(),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
