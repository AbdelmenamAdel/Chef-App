import 'package:chef/core/common/navigate.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/utils/app_images.dart';
import 'package:chef/core/widgets/customButton.dart';
import 'package:chef/core/widgets/customTextField.dart';
import 'package:chef/core/widgets/custom_Image.dart';
import 'package:chef/feature/auth/presentation/cubits/send_code/send_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/toast.dart';
import '../../../../core/routes/app_routs.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../cubits/send_code/send_code_state.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

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
            context.toView(Routes.login);
          },
        ),
        title: Text(AppStrings.fPassword.tr(context)),
        titleSpacing: 0.0.sp,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<SendCodeCubit, SendCodeState>(
          listener: (context, state) {
            if (state is SendCodeSuccessState) {
              showToast(
                  message: AppStrings.sendCodeSuccessfully.tr(context),
                  state: ToastStates.success);
              context.toView(Routes.resetPassword);
            }
            if (state is SendCodeErrorState) {
              showToast(message: state.message, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            SendCodeCubit cubit = BlocProvider.of<SendCodeCubit>(context);
            return Form(
              key: cubit.sendCodeKey,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
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
                      type: TextInputType.emailAddress,
                      controller: cubit.emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.emailN.tr(context);
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value) ||
                            !value.contains('@gmail.com')) {
                          return AppStrings.validEmail.tr(context);
                        }
                        return null;
                      },
                      onSave: (value) => cubit.emailController,
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    state is SendCodeLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                            onPressed: () {
                              if ((cubit.sendCodeKey.currentState!
                                  .validate())) {
                                cubit.sendCode();
                              } else {
                                return;
                              }
                            },
                            text: AppStrings.sendCode.tr(context),
                            width: double.infinity,
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
