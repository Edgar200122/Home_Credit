import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.widget,
    required this.width,
    required this.ontap,
  }) : super(key: key);
  final Widget widget;
  final double width;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: buttonBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget,
      ),
    );
  }
}
