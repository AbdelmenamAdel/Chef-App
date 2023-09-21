import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.controller,
    this.isPassword = false,
    this.onSave,
    this.onChange,
    this.suffixIconOnPressed,
    this.onSubmit,
    this.onTap,
    this.validator,
    this.prefix,
    this.type,
    this.suffix,
    this.labelText,
    this.hintText,
    this.width = double.infinity,
    this.readOnly = false,
  });
  String? labelText;
  String? hintText;
  bool readOnly;
  double? width;
  IconData? prefix;
  IconData? suffix;
  TextInputType? type;
  bool isPassword = false;
  Function(String?)? onSave;
  Function(String?)? onChange;
  Function(String?)? onSubmit;
  VoidCallback? onTap;
  VoidCallback? suffixIconOnPressed;
  String? Function(String?)? validator;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          width: width,
          child: TextFormField(
            readOnly: readOnly,
            onTap: onTap,
            onSaved: onSave,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              // prefixIcon: Icon(
              //   prefix,
              // ),
              suffixIcon: IconButton(
                iconSize: 16.sp,
                onPressed: suffixIconOnPressed,
                icon: Icon(
                  suffix,
                  color: AppColors.primary,
                ),
              ),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 16.sp, color: AppColors.gray),
              labelText: labelText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.gray,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
              ),
            ),
            obscureText: isPassword,
            onChanged: onChange,
            onFieldSubmitted: onSubmit,
            keyboardType: type,
          ),
        ),
      ],
    );
  }
}
