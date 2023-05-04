part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginChangeObscureIconState extends LoginState {}

class LoginLoadingGoogleSignInState extends LoginState {}

class LoginErrorGoogleSignInState extends LoginState {
  final String errorMsg;
  LoginErrorGoogleSignInState(this.errorMsg);
}

class LoginSuccessGoogleSignInState extends LoginState {
  final String uid;
  LoginSuccessGoogleSignInState(this.uid);
}

class SuccessLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String errorMsg;
  ErrorLoginState(this.errorMsg);
}

class LoadingLoginState extends LoginState {}

class LoginSuccessPhoneAuthState extends LoginState {}

class LoginErrorPhoneAuthState extends LoginState {
  final String errorMsg;
  LoginErrorPhoneAuthState(this.errorMsg);
}

class LoginLoadingPhoneAuthState extends LoginState {}