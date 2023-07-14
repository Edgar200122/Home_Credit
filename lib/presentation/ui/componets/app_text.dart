import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTexts extends StatelessWidget {
  const AppTexts({
    Key? key,
    required this.title,
    required this.fontSize,
    required this.fontWeight,
    this.color,
    this.textalign,
    this.height,
  }) : super(key: key);
  final String title;
  final double fontSize;
  final Color? color;
  final double? height;
  final TextAlign? textalign;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textalign ?? TextAlign.center,
      style: TextStyle(
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? textColor,
      ),
    );
  }
}
