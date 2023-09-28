import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/auth_repository.dart';
import 'send_code_state.dart';

class SendCodeCubit extends Cubit<SendCodeState> {
  SendCodeCubit(this.authRepo) : super(SendCodeInitial());
  final AuthRepository authRepo;
  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  //! send code method
  Future<void> sendCode() async {
    emit(SendCodeLoadingState());
    final result = await authRepo.sendCode(emailController.text);
    result.fold((l) => emit(SendCodeErrorState(l)),
        (r) => emit(SendCodeSuccessState(r)));
  }

  //! ##################### Reset Password Screen Info #######################
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  //! toggle new password icon
  bool isNewPassword = true;
  IconData? newIcon = Icons.visibility_off;
  TextEditingController newPasswordController = TextEditingController();

  void toggleNewPassword() {
    emit(IsNewPasswordOffState());
    isNewPassword = !isNewPassword;
    newIcon = isNewPassword ? Icons.visibility_off : Icons.visibility;
    emit(IsNewPasswordOnState());
  }

  //! toggle confirm password icon
  bool isConfirmPassword = true;
  IconData? confirmIcon = Icons.visibility_off;
  TextEditingController confirmPasswordController = TextEditingController();

  void toggleConfirmPassword() {
    emit(IsConfirmPasswordOffState());
    isConfirmPassword = !isConfirmPassword;
    confirmIcon = isConfirmPassword ? Icons.visibility_off : Icons.visibility;
    emit(IsConfirmPasswordOnState());
  }

  //! change password method that recive email and password and confirm password and code
  TextEditingController codeController = TextEditingController();

  void resetPassword() async {
    emit(ResetPasswordLoadingState());
    final result = await authRepo.resetPassword(
      code: codeController.text,
      confirmPassword: confirmPasswordController.text,
      email: emailController.text,
      password: newPasswordController.text,
    );
    result.fold((l) => emit(ResetPasswordErrorState(l)),
        (r) => emit(ResetPasswordSuccessState(r)));
  }
}
