import 'dart:io';
import 'package:app_p_10/core/costants/app_colors.dart';
import 'package:app_p_10/core/costants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:app_p_10/providers/settings_provider.dart';

class AddImage extends StatelessWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<SettingsProvider>(context);

    // ignore: no_leading_underscores_for_local_identifiers
    Future<void> _pickImage(ImageSource source) async {
      if (source == ImageSource.gallery) {
        await imageProvider.selectImageFromGallery();
      } else if (source == ImageSource.camera) {
        await imageProvider.selectImageFromCamera();
      }
    }

    return GestureDetector(
      onTap: () async {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        height: 144,
        width: 144,
        decoration: BoxDecoration(
          border: Border.all(color: activeIndicatorColor, width: 2),
          borderRadius: BorderRadius.circular(70),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.5),
          child: Consumer<SettingsProvider>(
            builder: (context, imageProvider, _) {
              if (imageProvider.imageUrl != null &&
                  imageProvider.imageUrl!.isNotEmpty) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.file(
                    File(imageProvider.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  height: 127,
                  width: 127,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: imageBackgroundColor,
                  ),
                  child: Image.asset(
                    defaultUserImageAdd,
                    height: 70,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
