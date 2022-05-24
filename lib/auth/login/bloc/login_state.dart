part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.emailField = '',
    this.passwordField = '',
  });

  final String emailField;
  final String passwordField;

  LoginState copyWith({
    String? emailField,
    String? passwordField,
  }) =>
      LoginState(
        emailField: emailField ?? this.emailField,
        passwordField: passwordField ?? this.passwordField,
      );

  @override
  List<Object> get props => [
        emailField,
        passwordField,
      ];
}

class LoginInitial extends LoginState {}
