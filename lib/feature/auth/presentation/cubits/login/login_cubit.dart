import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:chef/core/database/remote/end_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/models/login_model.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../data/repository/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  bool isPassword = true;
  IconData? loginIcon = Icons.visibility_off;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //! toggle password
  void togglePassword() {
    emit(IsPasswordLoadingState());
    isPassword = !isPassword;
    loginIcon = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(IsPasswordSuccessState());
  }

  //! login function
  LoginModel? loginModel;
  final AuthRepository authRepo;
  Future<void> login() async {
    emit(LoginLoadingState());
    final result = await authRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (l) => emit(LoginErrorState(l)),
      (r) {
        loginModel = r;
        sl<CacheHelper>().setData(key: Apikeys.token, value: r.message);
        emit(LoginSuccessState(r.token));
      },
    );
  }

  //! signUp function
  ErrorModel? errorModel;
  Future<void> signUp() async {
    emit(SignUpLoadingState());
    final result = await authRepo.signUp(
      email: emailController.text,
      password: passwordController.text,
      brandName: brandNameController.text,
      confirmPassword: confirmPasswordController.text,
      name: nameController.text,
      phone: phoneController.text,
    );
    result.fold(
      (l) => emit(SignUpErrorState(l)),
      (r) {
        emit(SignUpSuccessState(r));
      },
    );
  }
}
