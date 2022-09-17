part of 'password_reset_bloc.dart';

abstract class PasswordResetEvent extends Equatable {
  const PasswordResetEvent();

  @override
  List<Object?> get props => [];
}

class PasswordResetEmailChanged extends PasswordResetEvent {
  final String email;

  const PasswordResetEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordResetTokenChanged extends PasswordResetEvent {
  final String token;

  const PasswordResetTokenChanged(this.token);

  @override
  List<Object> get props => [token];
}

class PasswordResetPasswordChanged extends PasswordResetEvent {
  final String? password;
  final String? confirmPassword;

  const PasswordResetPasswordChanged({this.password, this.confirmPassword});

  @override
  List<Object?> get props => [password, confirmPassword];
}

class PasswordResetRequest extends PasswordResetEvent {
  const PasswordResetRequest();

  @override
  List<Object> get props => [];
}
