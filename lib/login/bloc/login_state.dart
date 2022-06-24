part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  failed,
  success,
  loading,
}

class LoginState extends Equatable {
  const LoginState({
    this.emailField = '',
    this.passwordField = '',
    this.loginStatus = LoginStatus.initial,
    this.user,
    this.errorMessage = '',
  });

  final String emailField;
  final String passwordField;
  final LoginStatus loginStatus;
  final User? user;
  final String errorMessage;

  bool get isEmailValid {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailField);
  }

  bool get isPasswordValid {
    return passwordField.length >= 6;
  }

  LoginState copyWith({
    String? emailField,
    String? passwordField,
    LoginStatus? loginStatus,
    User? user,
    String? errorMessage,
  }) =>
      LoginState(
        emailField: emailField ?? this.emailField,
        passwordField: passwordField ?? this.passwordField,
        loginStatus: loginStatus ?? this.loginStatus,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props =>
      [emailField, passwordField, loginStatus, user, errorMessage];
}

class LoginInitial extends LoginState {}
