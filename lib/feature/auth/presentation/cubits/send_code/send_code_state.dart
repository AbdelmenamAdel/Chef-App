sealed class SendCodeState {}

final class SendCodeInitial extends SendCodeState {}

final class IsNewPasswordOnState extends SendCodeState {}

final class IsNewPasswordOffState extends SendCodeState {}

final class IsConfirmPasswordOnState extends SendCodeState {}

final class IsConfirmPasswordOffState extends SendCodeState {}

final class SendCodeLoadingState extends SendCodeState {}

final class SendCodeSuccessState extends SendCodeState {
  final String message;

  SendCodeSuccessState(this.message);
}

final class SendCodeErrorState extends SendCodeState {
  final String message;

  SendCodeErrorState(this.message);
}

final class ResetPasswordLoadingState extends SendCodeState {}

final class ResetPasswordSuccessState extends SendCodeState {
  final String message;

  ResetPasswordSuccessState(this.message);
}

final class ResetPasswordErrorState extends SendCodeState {
  final String message;

  ResetPasswordErrorState(this.message);
}
