import 'package:app_p_10/presentation/ui/componets/app_text.dart';
import 'package:flutter/material.dart';

class OfferwallRow extends StatelessWidget {
  const OfferwallRow({
    Key? key,
    required this.image,
    required this.title,
    required this.percent,
  }) : super(key: key);
  final String image;
  final String title;
  final String percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: 70,
        ),
        const SizedBox(
          width: 15,
        ),
        AppTexts(
            title: title,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            textalign: TextAlign.start),
        const Spacer(),
        AppTexts(title: percent, fontSize: 16, fontWeight: FontWeight.w600),
      ],
    );
  }
}
