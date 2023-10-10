import 'package:chef/core/locale/app_locale.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class ImagePickerComponent extends StatelessWidget {
  const ImagePickerComponent({
    super.key,
    required this.cameraOnTap,
    required this.galleryOnTap,
  });
  final VoidCallback cameraOnTap;
  final VoidCallback galleryOnTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
              color: AppColors.primary,
              size: 32,
            ),
            title: Text(AppStrings.camera.tr(context),
                style: const TextStyle(color: AppColors.primary)),
            onTap: cameraOnTap,
          ),
          ListTile(
            leading: const Icon(
              Icons.photo,
              color: AppColors.primary,
              size: 32,
            ),
            title: Text(AppStrings.gallery.tr(context),
                style: const TextStyle(color: AppColors.primary)),
            onTap: galleryOnTap,
          ),
        ],
      ),
    );
  }
}
