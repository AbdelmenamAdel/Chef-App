import 'package:chef/core/common/navigate.dart';
import 'package:chef/core/locale/app_locale.dart';
import 'package:chef/core/routes/app_routs.dart';
import 'package:chef/core/utils/app_strings.dart';
import 'package:chef/core/widgets/customButton.dart';
import 'package:chef/core/widgets/customTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/toast.dart';
import '../../../../core/widgets/customTextField.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../cubits/login/login_cubit.dart';
import '../cubits/login/login_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            showToast(
                message: AppStrings.loginSuccessfully.tr(context),
                state: ToastStates.success);
          }
          if (state is SignUpErrorState) {
            showToast(
                message: state.errorModel.errorMessage,
                state: ToastStates.error);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: cubit.signUpKey,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //! name field
                    CustomTextField(
                      hintText: AppStrings.name.tr(context),
                      controller: cubit.nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.validPassword.tr(context);
                        }
                        return null;
                      },
                      onSave: (value) => cubit.nameController,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    //! phone field
                    CustomTextField(
                      hintText: AppStrings.phone.tr(context),
                      controller: cubit.phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.validPassword.tr(context);
                        }
                        return null;
                      },
                      onSave: (value) => cubit.phoneController,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    //! email field
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
                      height: 32.h,
                    ),
                    //! password field
                    CustomTextField(
                      hintText: AppStrings.password.tr(context),
                      isPassword: cubit.isPassword,
                      controller: cubit.passwordController,
                      prefix: Icons.lock,
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
                      onSave: (value) => cubit.passwordController,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    //! confirm password
                    CustomTextField(
                      hintText: AppStrings.confirmPassword.tr(context),
                      isPassword: cubit.isPassword,
                      controller: cubit.confirmPasswordController,
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
                        } else if (cubit.confirmPasswordController !=
                            cubit.passwordController) {
                          return AppStrings.dsntTheSamePassword.tr(context);
                        }
                        return null;
                      },
                      onSave: (value) => cubit.confirmPasswordController,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    //! brand name field
                    CustomTextField(
                      hintText: AppStrings.brandName.tr(context),
                      controller: cubit.brandNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.musntBMt.tr(context);
                        }
                        return null;
                      },
                      onSave: (value) => cubit.brandNameController,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //! already have an account button
                    Row(
                      children: [
                        CustomTextButton(
                          text: AppStrings.alHaveAcc.tr(context),
                          onPressed: () {
                            context.toView(Routes.login);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 64.h,
                    ),
                    // ! signUp button and indicator
                    state is LoginLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                            onPressed: () async {
                              if ((cubit.loginKey.currentState!.validate())) {
                                // await cubit.login();
                              } else {
                                return;
                              }
                            },
                            text: AppStrings.signUp.tr(context),
                            width: double.infinity,
                          ),
                    SizedBox(
                      height: 72.h,
                    ),
                    //! sign in text button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.dntHaveAcc.tr(context)),
                        CustomTextButton(
                          onPressed: () {},
                          text: AppStrings.signIn.tr(context),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
