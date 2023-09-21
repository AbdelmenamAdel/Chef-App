import 'package:chef/core/extensions/extension.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/routes/app_routs.dart';
import 'package:chef/core/utils/app_colors.dart';
import 'package:chef/core/utils/app_images.dart';
import 'package:chef/core/utils/app_strings.dart';
import 'package:chef/core/widgets/customButton.dart';
import 'package:chef/core/widgets/customTextButton.dart';
import 'package:chef/core/widgets/custom_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/customTextField.dart';
import '../cubits/login/login_cubit.dart';
import '../cubits/login/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var keyForm = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: keyForm,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const CustomImage(
                    image: AppImages.minBackground,
                    boxFit: BoxFit.none,
                  ),
                  Center(
                    child: Text(
                      AppStrings.welcome.tr(context),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          hintText: AppStrings.email.tr(context),
                          type: TextInputType.emailAddress,
                          controller: BlocProvider.of<LoginCubit>(context)
                              .emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSave: (value) =>
                              BlocProvider.of<LoginCubit>(context)
                                  .emailController,
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomTextField(
                          hintText: AppStrings.password.tr(context),
                          isPassword:
                              BlocProvider.of<LoginCubit>(context).isPassword,
                          controller: BlocProvider.of<LoginCubit>(context)
                              .passwordController,
                          prefix: Icons.lock,
                          suffixIconOnPressed: () {
                            BlocProvider.of<LoginCubit>(context)
                                .togglePassword();
                          },
                          suffix: BlocProvider.of<LoginCubit>(context).icon,
                          type: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          onSave: (value) =>
                              BlocProvider.of<LoginCubit>(context)
                                  .emailController,
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            CustomTextButton(
                              text: AppStrings.qFPassword.tr(context),
                              onPressed: () {
                                context.toView(Routes.sendCode);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 64.h),
                        CustomButton(
                          onPressed: () {
                            if ((keyForm.currentState!.validate())) {
                            } else {
                              return;
                            }
                          },
                          text: AppStrings.signIn.tr(context),
                          width: double.infinity,
                        ),
                        SizedBox(height: 72.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.dntHaveAcc.tr(context)),
                            CustomTextButton(
                              onPressed: () {},
                              text: AppStrings.signUp.tr(context),
                              color: AppColors.primary,
                            )
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
