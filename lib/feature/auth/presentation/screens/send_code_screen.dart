import 'package:chef/core/extensions/extension.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/routes/app_routs.dart';
import 'package:chef/core/utils/app_images.dart';
import 'package:chef/core/widgets/customButton.dart';
import 'package:chef/core/widgets/customTextField.dart';
import 'package:chef/core/widgets/custom_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';

class SendCodeScreen extends StatefulWidget {
  const SendCodeScreen({super.key});

  @override
  State<SendCodeScreen> createState() => _SendCodeScreenState();
}

class _SendCodeScreenState extends State<SendCodeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 32,
          icon: const Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppStrings.fPassword.tr(context)),
        titleSpacing: 0.0.sp,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              CustomImage(h: 300.h, w: 300.w, image: AppImages.lock),
              SizedBox(
                height: 26.sp,
              ),
              Text(AppStrings.fPTitle.tr(context)),
              SizedBox(
                height: 26.sp,
              ),
              CustomTextField(
                hintText: AppStrings.email.tr(context),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30.sp,
              ),
              CustomButton(
                onPressed: () {
                  if ((formKey.currentState!.validate())) {
                    context.toView(Routes.resetPassword);
                  } else {
                    return;
                  }
                },
                text: AppStrings.sendCode.tr(context),
                width: double.infinity,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
