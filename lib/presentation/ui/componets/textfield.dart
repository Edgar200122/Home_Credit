import 'package:app_p_10/core/costants/app_images.dart';
import 'package:app_p_10/providers/text_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<TextProvider>(context);

    return SizedBox(
      width: 210,
      child: TextField(
        maxLength: 17,
        cursorColor: Colors.grey,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        onChanged: (text) {
          textProvider.setTypedText(text);
        },
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          suffixIcon: GestureDetector(
            onTap: () {
              textProvider.setTypedText('');
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 18,
                bottom: 18,
              ),
              child: Image.asset(
                closeIcon,
                height: 20,
              ),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          labelText: 'Your name',
          hintText:
              textProvider.typedText != "" ? textProvider.typedText : "Name",
          labelStyle: const TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
