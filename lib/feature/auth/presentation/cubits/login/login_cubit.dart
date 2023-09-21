import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool isPassword = true;
  IconData? icon = Icons.visibility_off;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void togglePassword() {
    emit(IsPasswordLoading());
    isPassword = !isPassword;
    icon = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(IsPasswordSuccess());
  }
}
