import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_bar.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: containerTextColor,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          ontap: () {
            Navigator.pop(context, 'settings_page');
          },
          title: "Privacy Policy",
          widgetOne: Image.asset(
            arrowBack,
            height: 16,
          ),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                SizedBox(height: 20),
                AppTexts(
                  textalign: TextAlign.start,
                  title:
                      "Lorem ipsum dolor sit amet consectetur. Malesuada pharetra\nblandit eros nunc. Diam aliquet senectus sed habitant neque\nid sed mauваris. Id auctor nisl vestibulum urna mauris nulla\naliquam. Interdum nunc scelerisque dui sapien tincidunt\nparturient nunc tristique in. Viverra vitae faucibus id dolor\ntincidunt pівмroin. Aliquam vulputate orci nibh vitae aeque\nваcurabitur mauris nec eget sed interdum et. Diam mi\nvehicula vel mi tortor eu mauris. Libero magna scelerisque bit\njusto. Vulputate venenatis urna ante enim enim bibendum.\nViverra tortor risus sodales mauris amet interdum\npellваіentesque. Nulla habitant et non porta. Lobortis sem\ntristique interdum eleifend pharetra venenatis id sapien\nsollicitudin. ",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 20,
                ),
                AppTexts(
                  textalign: TextAlign.start,
                  title:
                      "Purus nullam feugiat pellentesque amet integer pharetra risus. Ac sit adipiscing adipiscing pretium est convallis. Orci arcu convallis integer neque enim accumsan auctor tincidunt. Porttitor tempor tortor viverra volutpat pulvinar eu. Ultricies sed venenatis ac erat volutpat et dignissim. Velit quam tincidunt enim lacus gravida consequat porttitor dui. Neque ваcurabitur mauris nec eget sed interdum et. Diam mi vehicula vel mi tortor eu mauris. Libero magna scelerisque bibendum pellentesque. Eget nec maecenas faucibus hendrerit adipiscing quam. Nunc auctor magna sit velit fermentum montes. Curabitur sed at fermentum ac urna vel. Netus vulputate cras cras ac. Non imperdiet mattis metus vestibulum quisque tortor amet aliquet faucibus. Fusce at nullam sed nam diam egestas erat.",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 20,
                ),
                AppTexts(
                  textalign: TextAlign.start,
                  title:
                      "Amet ac tellus eget in auctor bibendum facilisis venenatis a. Et quis egestas risus bibendum. Sed ut tortor justo pharetra facilisi volutpat hendrerit eu. Proin massa lacus blandit ac egestas turpis commodo velit. Adipiscing bibendum sit mollis consectetur in aliquet tempus lectus. Nibh aliquet molestie pretium lectus. Metus sit tellus enim ipsum neque molestie enim. Diam non gravida facilisis sed adipiscing enim at faucibus. Vestibulum enim porttitor morbi natoque faucibus at quis adipiscing. Tempus quis ut ac venenatis vitae id et. Non risus leo scelerisque orci fusce pretium est.",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
