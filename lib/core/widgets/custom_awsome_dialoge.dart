import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import 'customButton.dart';

// ignore: non_constant_identifier_names
AwesomeDialog CustomAwsomeDialoge(
  BuildContext context, {
  required String message,
  required VoidCallback okAction,
}) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.question,
    animType: AnimType.rightSlide,
    title: message,
    btnOk: CustomButton(
      backgroundColor: AppColors.green,
      onPressed: okAction,
      text: AppStrings.ok.tr(context),
    ),
    btnCancel: CustomButton(
      backgroundColor: AppColors.red,
      onPressed: () {
        Navigator.pop(context);
      },
      text: AppStrings.cancel.tr(context),
    ),
  );
}
