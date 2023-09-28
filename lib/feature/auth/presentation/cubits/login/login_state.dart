import '../../../../../core/errors/error_model.dart';
import '../../../../../core/models/login_model.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

//! toggle password states
final class IsPasswordLoadingState extends LoginState {}

final class IsPasswordSuccessState extends LoginState {}

//! login states
final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final String token;

  LoginSuccessState(this.token);
}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState(this.message);
}

//! sign up states
final class SignUpLoadingState extends LoginState {}

final class SignUpSuccessState extends LoginState {
  final LoginModel loginModel;

  SignUpSuccessState(this.loginModel);
}

final class SignUpErrorState extends LoginState {
  final ErrorModel errorModel;

  SignUpErrorState(this.errorModel);
}
