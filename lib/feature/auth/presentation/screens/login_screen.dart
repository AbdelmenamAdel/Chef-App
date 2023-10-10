import 'package:chef/core/common/navigate.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/routes/app_routs.dart';
import 'package:chef/core/utils/app_images.dart';
import 'package:chef/core/utils/app_strings.dart';
import 'package:chef/core/widgets/customButton.dart';
import 'package:chef/core/widgets/customTextButton.dart';
import 'package:chef/core/widgets/custom_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/toast.dart';
import '../../../../core/widgets/customTextField.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../cubits/login/login_cubit.dart';
import '../cubits/login/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! background image
            Stack(
              alignment: Alignment.center,
              children: [
                //! backgroundImage
                CustomImage(
                  image: AppImages.minBackground,
                  w: double.infinity,
                  h: 200.h,
                ),
                //! title
                Center(
                  child: Text(
                    AppStrings.welcome.tr(context),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ],
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  showToast(
                      message: AppStrings.loginSuccessfully.tr(context),
                      state: ToastStates.success);
                  context.toView(Routes.home);
                }
                if (state is LoginErrorState) {
                  showToast(message: state.message, state: ToastStates.error);
                }
              },
              builder: (context, state) {
                LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: cubit.loginKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //! email
                        CustomTextField(
                          hintText: AppStrings.email.tr(context),
                          type: TextInputType.emailAddress,
                          controller: cubit.emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.emailN.tr(context);
                            } else if (!RegExp(
                                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value) ||
                                !value.contains('@gmail.com')) {
                              return AppStrings.validEmail.tr(context);
                            }
                            return null;
                          },
                          onSave: (value) => cubit.emailController,
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        //! password field
                        CustomTextField(
                          hintText: AppStrings.password.tr(context),
                          isPassword: cubit.isPassword,
                          controller: cubit.passwordController,
                          suffixIconOnPressed: () {
                            cubit.togglePassword();
                          },
                          suffix: cubit.loginIcon,
                          type: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.validPassword.tr(context);
                            } else if (value.length < 6) {
                              return AppStrings.validPassword6.tr(context);
                            }
                            return null;
                          },
                          onSave: (value) => cubit.emailController,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        //! don't have an account button
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
                        SizedBox(
                          height: 64.h,
                        ),
                        // ! login button and indicator
                        state is LoginLoadingState
                            ? const CustomLoadingIndicator()
                            : CustomButton(
                                onPressed: () async {
                                  if ((cubit.loginKey.currentState!
                                      .validate())) {
                                    await cubit.login();
                                  } else {
                                    return;
                                  }
                                },
                                text: AppStrings.signIn.tr(context),
                                width: double.infinity,
                              ),
                        SizedBox(
                          height: 72.h,
                        ),
                        //! sign up text button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.dntHaveAcc.tr(context)),
                            CustomTextButton(
                              onPressed: () {
                                context.toView(Routes.signUp);
                              },
                              text: AppStrings.signUp.tr(context),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
