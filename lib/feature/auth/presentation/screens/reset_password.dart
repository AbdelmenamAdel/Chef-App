import 'package:chef/core/common/navigate.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/toast.dart';
import '../../../../core/routes/app_routs.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/customButton.dart';
import '../../../../core/widgets/customTextField.dart';
import '../../../../core/widgets/custom_Image.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../cubits/send_code/send_code_cubit.dart';
import '../cubits/send_code/send_code_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
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
            context.toView(Routes.sendCode);
          },
        ),
        title: Text(AppStrings.createNewPassH.tr(context)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocConsumer<SendCodeCubit, SendCodeState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccessState) {
                showToast(
                    message: AppStrings.changedSuccessfully.tr(context),
                    state: ToastStates.success);
                context.toView(Routes.login);
              }
              if (state is ResetPasswordErrorState) {
                showToast(message: state.message, state: ToastStates.error);
              }
            },
            builder: (context, state) {
              SendCodeCubit cubit = BlocProvider.of<SendCodeCubit>(context);
              return Form(
                key: cubit.resetPasswordKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    CustomImage(h: 300.h, w: 300.w, image: AppImages.lock),
                    SizedBox(
                      height: 26.sp,
                    ),
                    Row(
                      children: [
                        Text(AppStrings.createNewPassT.tr(context)),
                      ],
                    ),
                    SizedBox(
                      height: 26.sp,
                    ),
                    //! password
                    CustomTextField(
                      hintText: AppStrings.newPassword.tr(context),
                      isPassword: cubit.isNewPassword,
                      controller: cubit.newPasswordController,
                      suffixIconOnPressed: () {
                        cubit.toggleNewPassword();
                      },
                      suffix: cubit.newIcon,
                      type: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.validPassword.tr(context);
                        } else if (value.length < 6) {
                          return AppStrings.validPassword6.tr(context);
                        }
                        return null;
                      },
                      onSave: (value) => cubit.newPasswordController,
                    ),
                    SizedBox(
                      height: 26.sp,
                    ),
                    //! confirm password
                    CustomTextField(
                      hintText: AppStrings.confirmPassword.tr(context),
                      isPassword: cubit.isConfirmPassword,
                      controller: cubit.confirmPasswordController,
                      suffixIconOnPressed: () {
                        cubit.toggleConfirmPassword();
                      },
                      suffix: cubit.confirmIcon,
                      type: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.validPassword.tr(context);
                        } else if (value.length < 6) {
                          return AppStrings.validPassword6.tr(context);
                        } else if (value != cubit.newPasswordController.text) {
                          return AppStrings.dsntTheSamePassword.tr(context);
                        }
                        return null;
                      },
                      onSave: (value) => cubit.confirmPasswordController,
                    ),
                    SizedBox(
                      height: 26.sp,
                    ),
                    //! code
                    CustomTextField(
                      hintText: AppStrings.code.tr(context),
                      controller: cubit.codeController,
                      type: TextInputType.number,
                      validator: (value) {
                        if (num.tryParse(value!) == null) {
                          return AppStrings.validCode.tr(context);
                        }
                        if (value.isEmpty) {
                          return AppStrings.musntBMt.tr(context);
                        }
                        return null;
                      },
                      onSave: (value) => cubit.codeController,
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    //! reset button
                    state is ResetPasswordLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                            onPressed: () {
                              if ((cubit.resetPasswordKey.currentState!
                                  .validate())) {
                                cubit.resetPassword();
                              } else {
                                return;
                              }
                            },
                            text: AppStrings.resetPassword.tr(context),
                            width: double.infinity,
                          )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
