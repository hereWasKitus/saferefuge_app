part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChangedEvent extends LoginEvent {
  final String value;

  const LoginEmailChangedEvent(this.value);

  @override
  List<Object> get props => [value];
}

class LoginPasswordChangedEvent extends LoginEvent {
  final String value;

  const LoginPasswordChangedEvent(this.value);

  @override
  List<Object> get props => [value];
}

class LoginRequestEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginRequestEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
