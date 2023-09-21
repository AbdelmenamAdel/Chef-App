import 'package:chef/core/locale/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/customButton.dart';
import '../../../../core/widgets/customTextField.dart';
import '../../../../core/widgets/custom_Image.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
        title: Text(AppStrings.createNewPassH.tr(context)),
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
              Text(AppStrings.createNewPassT.tr(context)),
              SizedBox(
                height: 26.sp,
              ),
              CustomTextField(
                hintText: AppStrings.newPassword.tr(context),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 26.sp,
              ),
              CustomTextField(
                hintText: AppStrings.confirmPassword.tr(context),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 26.sp,
              ),
              CustomTextField(
                hintText: AppStrings.code.tr(context),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
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
                    // context.toView(Routes.resetPassword);
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
