part of 'password_reset_bloc.dart';

enum ResetStatus {
  initial,
  loading,
  success,
  failure,
}

class PasswordResetState extends Equatable {
  const PasswordResetState({
    this.token = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.status = ResetStatus.initial,
    this.error = '',
  });

  final String token;
  final String email;
  final String password;
  final String confirmPassword;
  final ResetStatus status;
  final String error;

  bool get isEmailValid => RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&.+-]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email);

  PasswordResetState copyWith({
    String? token,
    String? email,
    String? password,
    String? confirmPassword,
    ResetStatus? status,
    String? error,
  }) {
    return PasswordResetState(
      token: token ?? this.token,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        token,
        email,
        password,
        confirmPassword,
        status,
        error,
      ];
}
