import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:flutter/material.dart';

class CreditContainer extends StatelessWidget {
  const CreditContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "webview_page");
      },
      child: Container(
        height: 171,
        width: 382,
        decoration: BoxDecoration(
          color: activeIndicatorColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 49),
              child: AppTexts(
                title: "Apply\nfor loan",
                textalign: TextAlign.start,
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: containerTextColor,
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18)),
                child: Image.asset(
                  containerImage,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
